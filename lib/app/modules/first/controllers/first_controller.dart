import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/models/Tickers/Tickers_model.dart';

class FirstController extends GetxController {
 
  @override
  void onInit() {
    super.onInit();
    getTickerDetails();

  }



  final Dio dio = Dio();
  RxBool load=false.obs;
 

  TickersModel tickersModel = TickersModel();

  getTickerDetails ()async {
    try {
      load.value=true;

      final response = await dio.get('http://localhost:3000/tickers');


      log('response : ${response.data}');
      if(response.statusCode == 200){
        tickersModel = TickersModel.fromJson(response.data);
        // log('tickersModel : ${tickersModel.data}');
        // update();
        
      }


      
    } catch (e) {
      log('error : $e');
      
    }finally{
      load.value=false;
    }
}
}