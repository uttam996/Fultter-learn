import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/first_controller.dart';

class FirstView extends GetView<FirstController> {
  const FirstView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    (controller.load.value.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('TickersView'),
        centerTitle: true,
      ),
      body:Obx( ()=> controller.load.value?CircularProgressIndicator(): ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return   ListTile(
              title: Text(controller.tickersModel.symbol??'333'),
              subtitle: Text("fsdsd"),
            );
          },
        ),
      ), 
    );
  }
}
