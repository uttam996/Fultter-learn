
// [
// {
// "_id": "6554b34924ba2b30c53e45c8",
// "Symbol": "MATICUSDT",
// "buyPrice": 0.956,
// "buyQuantity": 25,
// "createdAt": "2023-11-15T12:02:17.702Z",
// "updatedAt": "2023-11-15T12:02:17.702Z",
// "__v": 0
// },
// {
// "_id": "6554b57024ba2b30c53e45cb",
// "Symbol": "MATICUSDT",
// "buyPrice": 0.9464,
// "buyQuantity": 25,
// "createdAt": "2023-11-15T12:11:28.200Z",
// "updatedAt": "2023-11-15T12:11:28.200Z",
// "__v": 0
// },

// ]

class OpenTrade {
  String? id;
  String? symbol;
  double? buyPrice;
  double? buyQuantity;
  String? createdAt;
  // String? updatedAt;

  OpenTrade({this.id, this.symbol, this.buyPrice, this.buyQuantity, this.createdAt});

  OpenTrade.fromJson(Map<String, dynamic> json) {
    id = json['_id'].toString();
    symbol = json['Symbol'].toString();
    buyPrice = (json['buyPrice'] is int) ? (json['buyPrice'] as int).toDouble() : json['buyPrice'];
    buyQuantity =(json['buyQuantity'] is int) ? (json['buyQuantity'] as int).toDouble() : json['buyQuantity'];
    createdAt = json['createdAt'].toString();
    // updatedAt = json['updatedAt'].toString();

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['Symbol'] = symbol;
    data['buyPrice'] = buyPrice;
    data['buyQuantity'] = buyQuantity;
    data['createdAt'] = createdAt;
    // data['updatedAt'] = updatedAt;
    return data;
  }


}