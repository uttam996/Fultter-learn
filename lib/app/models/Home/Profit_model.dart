// {
// "_id": null,
// "Alltime": 12.102499999999978,
// "today": 3.8550000000000004
// }


class ProfitModel {
  String? id;
  double? alltime;
  double? today;

  ProfitModel({this.id, this.alltime, this.today});

  // convert to double 

  ProfitModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'].toString();
    alltime = double.parse( json['Alltime'].toStringAsFixed(2));
    today = double.parse( json['today'].toStringAsFixed(2));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['Alltime'] = alltime;
    data['today'] = today;
    return data;
  }
}