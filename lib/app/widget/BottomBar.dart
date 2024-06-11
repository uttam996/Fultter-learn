
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/routes/app_pages.dart';
import 'package:learning_flutter_getx/constansts.dart';

final makeBottom = Container( 
    
      height: 55.0,
      child:  BottomAppBar(
        // border : Border.all(color: secondaryColor),

        
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: secondaryColor),
              onPressed: () {
                // Get.toNamed(Routes.HOME);
                Get.offAllNamed(Routes.HOME);
              
              },
            ),
            IconButton(
              icon:const Icon(Icons.blur_on, color: secondaryColor),
              onPressed: () {
                // Get.toNamed(Routes.COMPLETED);
                Get.offAllNamed(Routes.COMPLETED);
              },
            ),
            IconButton(
              icon: const Icon(Icons.hotel, color: secondaryColor),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_box, color: secondaryColor),
              onPressed: () {
                // Get.toNamed(Routes.TICKERS);
                Get.offAllNamed(Routes.TICKERS);
              },
            )
          ],
        ),
      ),
    );