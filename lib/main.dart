import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_flutter_getx/app/services/api_service.dart';
import 'package:learning_flutter_getx/constansts.dart';
import 'package:learning_flutter_getx/main_wrapper.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
        title: "Application",
        // initialRoute: AppPages.INITIAL,
        initialBinding: BindingsBuilder.put(() => ApiService()),
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        home:  const MainWrapper(),
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          fontFamily: "ui-sans-serif",
          appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor,

            // foregroundColor: secondaryColor,
          ),
        )),
  );
}

// main app  here 



