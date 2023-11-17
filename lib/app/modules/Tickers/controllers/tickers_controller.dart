
import 'dart:convert';
import 'dart:developer';


import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/models/Tickers/Tickers_model.dart';
import 'package:learning_flutter_getx/app/services/api_service.dart';


enum PageStatus {LOADING, LOADED, ERROR , NETWORK_ERROR}

class TickersController extends GetxController {

     ApiService apiService=ApiService() ;
 
 


  Rx<PageStatus> pageStatus = PageStatus.LOADING.obs;
  @override
  void onInit() {
    
    super.onInit();
    log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    getTickerDetails();
    

  }

List<TickersModel> tickersModel = [];

  Future<dynamic> getTickerDetails()async {
   
    try {
      final response = await apiService.get('http://172.30.2.23:4000/tickers');
     log('status code : ${response.statusCode}');
        log(response.toString());
          //  log(((response.body as List).first as Map).map((key, value) {
          //    return MapEntry(key, value.runtimeType);
          //  }).toString());


      if(response.statusCode == 200){
        
        tickersModel.addAll((response.body as List).map((e) => TickersModel.fromJson(e)));
     
        return response.body;
      }else{
    log('in');

        return Future.error(response.statusText!);
      }
    } catch (e) {
      log('error: $e');
      return Future.error(e);
    }
  }

  // getTickerDetails()async {
  //   try {

  //    Response response = await apiService.getTickerDetails();
  //    log(response.toString());

  //   }
  //   catch(e){
  //     log(e.toString());
  //   }

  // }



 
  
}
