import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/models/Home/CompletedTrade_model.dart';

import 'package:learning_flutter_getx/app/services/api_service.dart';
import 'package:learning_flutter_getx/app/services/api_url.dart';


class CompletedController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    log('completed controller init');
    getCompleted();
    log('completed controller init');
  }

  ApiService apiService = ApiService();
  ApiUrl apiUrl = ApiUrl();
  RxBool load = false.obs;
  List<CompletdTradeModel> completedTrade = [];

  Future<dynamic> getCompleted() async {
    load.value = true;
    try {
      final response = await apiService.get(apiUrl.completedTrade);
      log('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
          completedTrade.addAll((response.body as List).map((e) => CompletdTradeModel.fromJson(e)));
       
        // log(jsonEncode(response.body));
        return response.body;
      } else {
        return Future.error(response.statusText!);
      }
    } catch (e) {
      log('error: $e');
      return Future.error(e);
    } finally {
      load.value = false;
    }
  }

  getProfits(buyPrice,saleprice,buyQuantity,sellQuantity) {
    var profit = (saleprice*buyQuantity) - (buyPrice*sellQuantity);
    
    return profit.toStringAsFixed(2).toString();
   
  }
}

