import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/widget/BottomBar.dart';
import 'package:learning_flutter_getx/constansts.dart';

import '../controllers/completed_controller.dart';

class CompletedView extends GetView<CompletedController> {
   CompletedView({super.key});

  final CompletedController controller = Get.put(CompletedController());
  @override
  Widget build(BuildContext context) {
    return 
       
       Obx(() => controller.load.value==false? Container(
        
        padding: const EdgeInsets.all(8.0),
        
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          
          // scroll behavior smooth


          
          itemCount: controller.completedTrade.length,
          itemBuilder: (context, index) {
            return Card(
              color:  primaryColor,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              
              child: ListTile(
                tileColor: secondaryColor,
                textColor: primaryColor,
                
                title: Text(controller.completedTrade[index].symbol.toString() ,style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                  letterSpacing: 1

                  
                ),),
                subtitle: Text(controller.completedTrade[index].buyQuantity.toString()),
                trailing: Column(
                  children: [
                    Text(controller.completedTrade[index].buyPrice.toString()),
                    Text(controller.completedTrade[index].sellPrice.toString()),
                    Text(controller.getProfits(
                        controller.completedTrade[index].buyPrice
                      , controller.completedTrade[index].sellPrice 
                      , controller.completedTrade[index].buyQuantity, controller.completedTrade[index].sellQuantity)),
                  ],
                ),
              )
              
            );
          },
        ),
      ):const CircularProgressIndicator())
    ;
    
  }
}
