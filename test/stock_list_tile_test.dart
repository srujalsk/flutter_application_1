import 'package:flutter_application_1/api/stock_data_api.dart';
import 'package:flutter_application_1/models/stock.dart';
import 'package:flutter_application_1/widgets/stock_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('StockListTile', () {
    testWidgets('builds a ListTile with Stock data', (tester) async {
      final stock = Stock(name: 'Test Stock', description: 'Test Description', symbol: 'TEST', price: 10.0);
      final stockListTile = MaterialApp(
        home: Scaffold(
          body: StockListTile(stock: stock, api: StockDataApi()),
        ),
      );
      await tester.pumpWidget(stockListTile);
      expect(find.text('Test Stock'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('10.00'), findsOneWidget);
    });

  });
}