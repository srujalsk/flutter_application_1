class WsMessageStock {
  final String symbol;
  final double price;

  const WsMessageStock({required this.symbol, required this.price});

  factory WsMessageStock.fromJson(Map<String, dynamic> json) {
    return WsMessageStock(
      symbol: json['s'] as String,
      price: json['p'] as double,
    );
  }
}

