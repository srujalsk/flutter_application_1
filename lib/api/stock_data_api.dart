import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;
import '../models/stock.dart';
import '../models/ws_message_stock.dart';

class StockDataApi {

  /// API key for the stock data API
  final apiKey = '<YOUR-API-KEY>';

  late WebSocketChannel activeWebSocketChannel;


  /// An event that is fired whenever the stock data changes
  ///
  /// This can be used by other parts of the app to keep track of changes in stock price.
  final _stockPriceStreamController = StreamController<WsMessageStock>.broadcast();
  Stream<WsMessageStock> get stockPriceStream => _stockPriceStreamController.stream;


  /// Fetches the list of stocks from the API
  ///
  /// Returns a list of [Stock] objects, or an empty list if the request fails.
  ///
  /// Throws an [Exception] if the request fails.
  Future<List<Stock>> fetchStocks() async {
    try {
      final response = await http.get(Uri.parse('https://finnhub.io/api/v1/forex/symbol?exchange=oanda&token=$apiKey'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        /// Only return the first 20 stocks so that we don't get oversubscribed message
        return (jsonData.map<Stock>((jsonStock) => Stock.fromJson(jsonStock)).toList() as List<Stock>).take(20).toList();
      } else {
        throw Exception('Failed to load stocks - ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }


/// Initializes a WebSocket connection to the stock data API.
///
/// Connects to the WebSocket server using the API token and listens for incoming messages.
/// Upon receiving a message, the message is parsed using [_parseWebSocketMessage].
/// Logs connection status, received messages, and errors if they occur.
///
/// Throws any exception encountered during the connection attempt.
  void initializeWebSocketConnection() async {
    try {
      final wsUrl = Uri.parse('wss://ws.finnhub.io?token=$apiKey');
      activeWebSocketChannel = WebSocketChannel.connect(wsUrl);
      activeWebSocketChannel.stream.listen((message) {
        _parseWebSocketMessage(message);
      });

    } catch (e) {
      rethrow;
    }
  }

  /// Private function to parse a websocket message
  ///
  /// The message is expected to be a JSON-encoded string, and should contain the following keys:
  /// - 'data' - an array of stock price objects
  /// - 'type' - the type of message (currently only 'trade' is supported)
  ///
  /// Returns a list of [WsMessageStock] objects, or an empty list if the message is invalid.
  void _parseWebSocketMessage(String message) {
    final jsonData = jsonDecode(message);
    if (jsonData['data'] != null && jsonData['type'] == 'trade') {
      final messages = jsonData['data'].map<WsMessageStock>((jsonStock) => WsMessageStock.fromJson(jsonStock)).toList() as List<WsMessageStock>;

      for (var msg in messages) {
        _stockPriceStreamController.add(msg);
      }
    }
  }


  /// Subscribes to stock data by sending a message to the websocket
  ///
  /// Subscribes to the stock with the given symbol. If the symbol is not
  /// provided, subscribes to all stocks.
  void subscribeToStock(String symbol) {
    final message = '{"type":"subscribe","symbol":"$symbol"}';
    if (activeWebSocketChannel.closeCode == null) {
      activeWebSocketChannel.sink.add(message);
    }
  }


}
