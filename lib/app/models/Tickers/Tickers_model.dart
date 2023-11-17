// [
// {
// "_id": "654fdcaf3ba5d36c65a3eafc",
// "symbol": "SOLUSDT",
// "quantity": 1,
// "buyPercentage": 2,
// "sellPercentage": 2,
// "running": true,
// "__v": 0,
// "fixed": 3
// },
// {
// "_id": "654fdcaf3ba5d37c65a3eafc",
// "symbol": "DOTUSDT",
// "quantity": 2,
// "buyPercentage": 0.2,
// "sellPercentage": 0.2,
// "running": true,
// "__v": 0,
// "fixed": 3
// },
// {
// "_id": "654fdcaf3ba5d36c65a5eafc",
// "symbol": "MATICUSDT",
// "quantity": 25,
// "buyPercentage": 1,
// "sellPercentage": 1,
// "running": true,
// "__v": 0,
// "fixed": 4
// }
// ]

class TickersModel {
  String? id;
  String? symbol;
  int? quantity;
  double? buyPercentage;
  double? sellPercentage;
  bool? running;
  int? fixed;

  TickersModel(
      {this.id,
      this.symbol,
      this.quantity,
      this.buyPercentage,
      this.sellPercentage,
      this.running,
      this.fixed});

  TickersModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'].toString();
    symbol = json['symbol'].toString();
    quantity = json['quantity'];
    buyPercentage = (json['buyPercentage'] is int)?(json['buyPercentage'] as int).toDouble():json['buyPercentage'] ;
    sellPercentage = (json['sellPercentage'] is int)?(json['sellPercentage']as int ).toDouble():json['sellPercentage'] ;
    running = json['running'];
    fixed = json['fixed'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['symbol'] = symbol;
    data['quantity'] = quantity;
    data['buyPercentage'] = buyPercentage;
    data['sellPercentage'] = sellPercentage;
    data['running'] = running;
    data['fixed'] = fixed;
    return data;
  }
  
}
