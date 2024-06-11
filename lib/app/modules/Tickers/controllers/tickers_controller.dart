import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/models/Tickers/Tickers_model.dart';
import 'package:learning_flutter_getx/app/services/api_service.dart';
import 'package:learning_flutter_getx/app/services/api_url.dart';

enum PageStatus { LOADING, LOADED, ERROR, NETWORK_ERROR }

class TickersController extends GetxController {
  ApiService apiService = ApiService();
  ApiUrl apiUrl = ApiUrl();

  RxBool load = false.obs;
  RxBool updateLoad = false.obs;

  Rx<PageStatus> pageStatus = PageStatus.LOADING.obs;
  @override
  void onInit() {
    super.onInit();
    


    log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

    getTickerDetails();
  }

  List<TickersModel> tickersModel = [];

  Future<dynamic> getTickerDetails() async {
    load.value = true;

    try {
      final response = await apiService.get(apiUrl.tickers);
      log('status code : ${response.statusCode}');
      log(response.toString());
      //  log(((response.body as List).first as Map).map((key, value) {
      //    return MapEntry(key, value.runtimeType);
      //  }).toString());

      if (response.statusCode == 200) {
        tickersModel.addAll(
            (response.body as List).map((e) => TickersModel.fromJson(e)));

        return response.body;
      } else {
        log('in');

        return Future.error(response.statusText!);
      }
    } catch (e) {
      log('error: $e');

      return Future.error(e);
    } finally {
      load.value = false;
    }
  }

  updateTickers(data) async {
      log(jsonEncode(data));

    try {
      updateLoad.value = true;
      final response = await apiService.patch(
          apiUrl.tickersUpdate,
          jsonEncode({
            "_id": data["_id"],
            "symbol": data["symbol"],
            "quantity": data["quantity"],
            "buyPercentage": data["buyPercentage"],
            "sellPercentage": data["sellPercentage"],
            "running": data["running"]
          }));

          

        


      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Ticker Updated');
      } else {
        if (response.statusCode == 400) {
          log(response.body.toString());
          // Get.snackbar('Error',response.body["message"].toString() );
          
        }
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      updateLoad.value = false;
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
