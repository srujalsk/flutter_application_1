import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/stock.dart';
import '../api/stock_data_api.dart';
import 'stock_list_tile.dart';

class StockList extends StatefulWidget {
  const StockList({super.key});
  
  @override
  StockListState createState() => StockListState();
}

class StockListState extends State<StockList> {
  List<Stock> _stocks = [];
  bool _isLoading = true;
  final _api = StockDataApi();

  @override
  void initState() {
    super.initState();

    /// Initialize WebSocket connection
    _api.initializeWebSocketConnection();

    /// Fetch stocks
    _api.fetchStocks().then((stocks) {

      /// Set stocks data state
      setState(() {
        _stocks = stocks;
      });

      /// Subscribe to all stocks
      for (var stock in stocks) {
        _api.subscribeToStock(stock.symbol);
      }

      /// Listen for stock price updates
      _api.stockPriceStream.listen((stockMessage) {
        /// Update stock price
        var stock = _stocks.firstWhere((element) => element.symbol == stockMessage.symbol);
        setState(() {
          stock.price = stockMessage.price;
        });
      });

    }).onError((error, stackTrace) {
      setState(() {
        _stocks = [];
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    if (_isLoading) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.white,
                height: 20,
              ),
            ),
            trailing: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.white,
                height: 20,
                width: 40,
              ),
            ),
          );
        },
      );
    }

    return Flexible(
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _stocks.length,
        itemBuilder: (context, index) {
          final stock = _stocks[index];
          return StockListTile(stock: stock, api: _api);
        },
      ),
    );
  }
}
