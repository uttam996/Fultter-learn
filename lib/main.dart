import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learning_flutter_getx/app/services/api_service.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: BindingsBuilder.put(() => ApiService()),
      getPages: AppPages.routes,

      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          backgroundColor:  Colors.blue,
        ),
      )
    ),
  );
}
