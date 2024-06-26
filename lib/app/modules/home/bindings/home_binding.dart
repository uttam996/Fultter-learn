import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/services/api_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    ApiService apiService = Get.find<ApiService>();
    Get.put(HomeController());
  }
}
