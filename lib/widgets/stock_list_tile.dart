import 'package:flutter/material.dart';

import '../api/stock_data_api.dart';
import '../models/stock.dart';

class StockListTile extends StatefulWidget {
  final Stock stock;
  final StockDataApi api;

  const StockListTile({super.key, required this.stock, required this.api});

  @override
  StockListTileState createState() => StockListTileState();
}

class StockListTileState extends State<StockListTile> {

  @override
  void initState() {
    super.initState();

    // if(mounted) {
    //   widget.api.stockPriceStream.listen((stockMessage) {
    //     // print('Broadcast Received - ${stockMessage.symbol} | ${stockMessage.price}');

    //     if(stockMessage.symbol == widget.stock.symbol) {
    //       setState(() {
    //         currentPrice = stockMessage.price;
    //       });
    //     }
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.blueGrey[50],
      title: Text(widget.stock.name),
      trailing: Text(widget.stock.price.toStringAsFixed(2)),
      subtitle: Text(widget.stock.description),
    );
  }
}
