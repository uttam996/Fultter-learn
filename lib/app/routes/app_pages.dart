import 'package:get/get.dart';

import '../modules/Tickers/bindings/tickers_binding.dart';
import '../modules/Tickers/views/tickers_view.dart';
import '../modules/first/bindings/first_binding.dart';
import '../modules/first/views/first_view.dart';
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
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TICKERS,
      page: () => const TickersView(),
      binding: TickersBinding(),
    ),
   
  ];
}
