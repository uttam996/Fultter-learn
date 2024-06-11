import 'package:get/get.dart';

import '../modules/Tickers/bindings/tickers_binding.dart';
import '../modules/Tickers/views/tickers_view.dart';
import '../modules/completed/bindings/completed_binding.dart';
import '../modules/completed/views/completed_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () =>  HomeView(),
        binding: HomeBinding(),
        // transition: Transition.leftToRight
        ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TICKERS,
      page: () =>  TickersView(),
      binding: TickersBinding(),
  
    ),
    GetPage(
      name: _Paths.COMPLETED,
      page: () =>  CompletedView(),
      binding: CompletedBinding(),
      // previous route home  left to right if prvious route  completed transition right to left,

    
    ),
  ];
}
