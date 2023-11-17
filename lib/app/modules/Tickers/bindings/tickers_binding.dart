import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/services/api_service.dart';

import '../controllers/tickers_controller.dart';

class TickersBinding extends Bindings {
  @override
  void dependencies() {
    ApiService apiService = Get.find<ApiService>();
    Get.put(TickersController());
    

  }
}
