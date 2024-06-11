import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/models/Home/OpenTrade_model.dart';
import 'package:learning_flutter_getx/app/models/Home/Profit_model.dart';
import 'package:learning_flutter_getx/app/services/api_service.dart';
import 'package:learning_flutter_getx/app/services/api_url.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    log('honme controller init');
  getAll();  
  }

  Future<void>getAll()async{
    await getProfit();
    await getopenTrade();
  }

  ApiService apiService = ApiService();
  ApiUrl apiUrl = ApiUrl();

  // object of api service class

  ProfittModel profitModel = ProfitModel();
  List<OpenTrade> openTrade = [];
  // loading status
  RxBool pendingLoading = false.obs;
  RxBool load = false.obs;

  Future<dynamic> getopenTrade() async {
    try {
      pendingLoading.value = true;
      final response = await apiService.get(apiUrl.openTrade);
      log(apiUrl.openTrade);
      log('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        openTrade
            .addAll((response.body as List).map((e) => OpenTrade.fromJson(e)));

        log(jsonEncode(response.body));
      }
    } catch (e) {
      log('error: $e');
      return Future.error(e);
    } finally {
      pendingLoading.value = false;
    }
  }

  Future<dynamic> getProfit() async {
    try {
      load.value = true;

      final response = await apiService.get(apiUrl.profit);

      log('status code profit : ${response.statusCode}');

      if (response.statusCode == 200) {
        log(jsonEncode(response.body));

        //
        profitModel = ProfitModel.fromJson(response.body);
        log("${profitModel.today}");
        log("${profitModel.alltime}");
      }
    } catch (e) {
      log('error: $e');
      return Future.error(e);
    } finally {
      load.value = false;
    }
  }

 
}
