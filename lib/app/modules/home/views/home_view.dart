import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/widget/drawer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override

  



  
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        
        
        

      ),
      body:  Obx( ()=>  controller.load.value?Center(child: CircularProgressIndicator(),): Column(
          
          children: [
          const SizedBox(
            height: 10,
            
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                //padding 
      
                child: Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: SizedBox(
                
                    width: 170,
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                      children: [
                       const Text(
                          'Today Profit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                     Text("${controller.profitModel.today}" ,style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 170,
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                      children: [
                         const Text(
                          'Today Profit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(controller.profitModel.alltime.toString() ,style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              // two card in a row
            ],
          ),
      
       const SizedBox(
            height: 10,
            
          ),
      
           ListView.builder(itemBuilder: (context,index){
      
            return const ListTile(
              style: ListTileStyle.list,
              
      
              leading: CircleAvatar(child: Text('Sell'),backgroundColor: Colors.red,),
              title: Text('MATICUSDT'),
              subtitle: Text('0.00000000'),
              trailing: Column(
                children: [
                   Text('Running'),
                  Text('0.00000000'),
                  Text('0.00000000'),
                ],
              ),
            );
          } ,itemCount: 5,shrinkWrap: true,),
        
          
          
          ],
          
        ),
      )
    );
  }
}


