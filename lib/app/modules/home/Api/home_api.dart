import 'dart:math';

import 'package:learning_flutter_getx/app/services/api_service.dart';

extension HomeApi on ApiService{

  Future<dynamic> getProfit()async {
    try {
      final response = await get('http://localhost:4000/tickers');
     
      if(response.statusCode == 200){
        return response.body;
      }else{
        return Future.error(response.statusText!);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

}