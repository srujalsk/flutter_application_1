class Stock {
  final String name;
  final String description;
  final String symbol;
  double price;

  Stock({required this.name, required this.price, required this.description, required this.symbol});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      name: json['displaySymbol'] as String,
      description: json['description'] as String,
      symbol: json['symbol'] as String,
      price: 0.0,
    );
  }
}

