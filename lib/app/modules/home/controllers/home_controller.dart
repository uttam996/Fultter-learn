import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/models/Home/Profit_model.dart';
import 'package:learning_flutter_getx/app/services/api_service.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    log('honme controller init');
    getProfit();
   
  }

  ApiService apiService =ApiService();
  // object of api service class

   ProfitModel profitModel = ProfitModel();
   // loading status
  RxBool load=false.obs;


  Future<dynamic> getProfit()async {
    try {
      load.value=true;
      final response = await apiService.get("http://192.168.60.59:4000/order/profit");
      

     log('status code : ${response.statusCode}');
       

      if(response.statusCode == 200){
         log(jsonEncode(response.body));
          
          // 
          profitModel = ProfitModel.fromJson(response.body);
          log("${profitModel.today}");
          log("${profitModel.alltime}");
          
         
       
        
      }

      

    } catch (e) {
      log('error: $e');
      return Future.error(e);
    }finally{
      load.value=false;

    }


  }

}
 
