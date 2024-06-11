import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/modules/home/controllers/home_controller.dart';
import 'package:learning_flutter_getx/constansts.dart';




class HomeView extends GetView<HomeController> {
   HomeView({super.key});

  @override
  final controller = Get.put(HomeController());
  

  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
        onRefresh: () async {
          await controller.getProfit();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,0),
          child: Column(
            // physics: NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 ProfitCard(
                  
                  title: 'today',
                      ),
              
                  ProfitCard(
                    title: 'alltime',
                    
                  
                  
                  ),
              
        
                ],
              ),
             
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.fromLTRB(4, 10, 4, 0),
                height: 50,
                decoration: BoxDecoration(
                  // color: secondaryColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),

                child: const Text(
                  'Open Trades',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                    
              
              
                  ),
                ),
              ),
              Obx(
                () => controller.pendingLoading.value
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                          
                        
                          itemCount: controller.openTrade.length,
                          itemBuilder: (context, index) {
                            var openTrade = controller.openTrade;
                            return Card(
                              
                              elevation: 4,
                              color:  secondaryColor,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.8),
                                  width: 1,
                                ),
                              ),
                              child: ListTile(
                                
                                textColor:  primaryColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                title: Text(openTrade[index].symbol.toString(),style:const TextStyle(
                                  letterSpacing: 1,
                                  
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                                
                                ),),
                                subtitle: Text(
                                    'Amount ${controller.openTrade[index].buyQuantity.toString()}',style:const TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 0
                                    ),),
                                trailing: Column(
                                  children: [
                                    // date time
                                    Text(
                                      // convert date time to dd-mm-yyyy hh:mm 
                                      controller.openTrade[index].createdAt.toString().substring(0,10),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),

                                    ),
                                    Text(controller.openTrade[index].buyPrice
                                        .toString()),
                                  ],
                                ),
                              ),
                            );
                          },
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                        ),
                      ),
              )
            ],
          ),
        ),
      
    );
  }
}

class ProfitCard extends StatelessWidget {
   ProfitCard(
      {super.key,required this.title});

  final HomeController homeController = Get.find<HomeController>();
  final String title;

  @override
  Widget build(BuildContext context) {

    return  Card(
      color: secondaryColor,
      elevation: 4,
    
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(
          // color: Colors.grey,
          
           width: 0,
        ),
      ),

      //padding

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          // half of screen  mediaquery
          width: MediaQuery.of(context).size.width / 2.6,
          height: 60,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              Text((
                title=="today" ? "Today Profit" : "All Profit"
              ),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              // if loading show loading else show use Obx 
              
            Obx(() =>   homeController.load.value ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  
                ),
              )  :
             Text(
                title=="today" ? "\$ ${homeController.profitModel.today.toString()}" : "\$ ${homeController.profitModel.alltime.toString()} ",
                style:const TextStyle(
                  fontSize: 16,
                  fontFamily: '',
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),)


              

              // isloading ? const CircularProgressIndicator() :
              // Text(value,
              //   style:const TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.green,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    )
    ;


  }
}
