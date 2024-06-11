// [
// {
// "_id": "65544e1397fcac6810f61191",
// "Symbol": "MATICUSDT",
// "buyPrice": 0.9395,
// "buyQuantity": 25,
// "createdAt": "2023-11-15T04:50:27.019Z",
// "updatedAt": "2023-11-15T04:51:25.599Z",
// "__v": 0,
// "sellPrice": 0.9414,
// "sellQuantity": 25
// },
// {
// "_id": "6554503325087aaac0cc4acf",
// "Symbol": "MATICUSDT",
// "buyPrice": 0.9425,
// "buyQuantity": 25,
// "createdAt": "2023-11-15T04:59:31.027Z",
// "updatedAt": "2023-11-15T05:00:26.238Z",
// "__v": 0,
// "sellPrice": 0.9434,
// "sellQuantity": 25
// },
// ]


class CompletdTradeModel {

  String? id;
  String? symbol;
  double? buyPrice;
  double? buyQuantity;
  String? createdAt;
  String? updatedAt;
  double? sellPrice;
  double? sellQuantity;

  CompletdTradeModel({this.id, this.symbol, this.buyPrice, this.buyQuantity, this.createdAt, this.updatedAt, this.sellPrice, this.sellQuantity});

  CompletdTradeModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'].toString();
    symbol = json['Symbol'].toString();
    buyPrice = (json['buyPrice'] is int) ? (json['buyPrice'] as int).toDouble() : json['buyPrice'];
    buyQuantity = (json['buyQuantity'] is int) ? (json['buyQuantity'] as int).toDouble() : json['buyQuantity'];
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    sellPrice = (json['sellPrice'] is int) ? (json['sellPrice'] as int).toDouble() : json['sellPrice'];
    sellQuantity = (json['sellQuantity'] is int) ? (json['sellQuantity'] as int).toDouble() : json['sellQuantity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['Symbol'] = symbol;
    data['buyPrice'] = buyPrice;
    data['buyQuantity'] = buyQuantity;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['sellPrice'] = sellPrice;
    data['sellQuantity'] = sellQuantity;
    return data;
  }
}