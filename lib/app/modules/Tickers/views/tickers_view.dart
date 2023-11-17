import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/tickers_controller.dart';

class TickersView extends GetView<TickersController> {
  const TickersView({super.key});
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickers View'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.tickersModel.length,
        itemBuilder: (context, index) {
          return    ListTile(
          style: ListTileStyle.list,

          title:  Text(controller.tickersModel[index].symbol!),
          subtitle: Text(controller.tickersModel[index].quantity.toString()),
          trailing: Column(
            
            children: [
              if (controller.tickersModel[index].running!) const Text("Running",style: TextStyle(
                color: Colors.green
              
              ),) else const Text('Stopped'), 
            
              
              Text(controller.tickersModel[index].buyPercentage.toString()),
              Text(controller.tickersModel[index].sellPercentage.toString()),
            ],
          )
          

          );
          
          },
      ),
          
          
        
      
    );
  }
}
