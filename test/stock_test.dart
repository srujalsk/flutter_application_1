import 'package:test/test.dart';
import 'package:flutter_application_1/models/stock.dart';

void main() {
  group('Stock', () {
    test('constructor creates a valid Stock object', () {
      final stock = Stock(name: 'Test Stock', description: 'Test Description', symbol: 'TEST', price: 10.0);
      expect(stock.name, 'Test Stock');
      expect(stock.description, 'Test Description');
      expect(stock.symbol, 'TEST');
      expect(stock.price, 10.0);
    });

    test('fromJson creates a valid Stock object from JSON', () {
      final json = {
        'displaySymbol': 'Test Stock',
        'description': 'Test Description',
        'symbol': 'TEST',
      };
      final stock = Stock.fromJson(json);
      expect(stock.name, 'Test Stock');
      expect(stock.description, 'Test Description');
      expect(stock.symbol, 'TEST');
      expect(stock.price, 0.0);
    });
  });
}

