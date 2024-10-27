import 'package:test/test.dart';
import 'package:flutter_application_1/api/stock_data_api.dart';

void main() {
  group('StockDataApi', () {
    test('fetchStockData returns a list of Stock objects', () async {
      final api = StockDataApi();
      final response = await api.fetchStocks();
      expect(response.length, greaterThan(0));
    });
  });
}