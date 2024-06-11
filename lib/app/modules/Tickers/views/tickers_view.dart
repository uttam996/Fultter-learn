import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning_flutter_getx/constansts.dart';

import '../controllers/tickers_controller.dart';

class TickersView extends GetView<TickersController> {
  TickersView({super.key});
  final TickersController controller = Get.put(TickersController());
  @override
  Widget build(BuildContext context) {
    return 
      Obx(
        () => controller.load.value
            ? const CircularProgressIndicator()
            : RefreshIndicator(
                onRefresh: () async {
                  // reset the list 
                  controller.tickersModel.clear();
                  await controller.getTickerDetails();
                },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16 , 0, 16, 0),
                child: ListView.builder(
                    itemCount: controller.tickersModel.length,
                    
                    itemBuilder: (context, index) {
                      return Card(
                        color:  primaryColor,
                        borderOnForeground: false,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                         
                        ),
                        
                        child: ListTile(
                          
                          textColor: secondaryColor,
                            onTap: () {
                              log('tap');
                              //pass the data to the edit screen from the bottom sheet
                              showModalBottomSheet(
                                // show keyboard above bottom sheet
                                isScrollControlled: true,
                                  
                                context: context,
                                builder: (context) =>
                                    TickersEdit(data: controller.tickersModel[index]),
                              );
                            },
                           
                            title: Text(
                                controller.tickersModel[index].symbol.toString()),
                            subtitle: Text(
                                controller.tickersModel[index].quantity.toString()),
                            trailing: Column(
                              children: [
                                if (controller.tickersModel[index].running!)
                                  const Text(
                                    "Running",
                                    style: TextStyle(color: Colors.green),
                                  )
                                else
                                  const Text('Stopped'),
                                Text(controller.tickersModel[index].buyPercentage
                                    .toString()),
                                Text(controller.tickersModel[index].sellPercentage
                                    .toString()),
                              ],
                            )),
                      );
                    },
                  ),
              ),
            ),
      );
    
  }
}

class TickersEdit extends StatefulWidget {
  TickersEdit({super.key, this.data});

  var data;
  final mycontroller = TickersController();

  @override
  State<TickersEdit> createState() => _TickersEditState();
}

class _TickersEditState extends State<TickersEdit> {
  @override
  Widget build(BuildContext context) {
    return
        // open from bottom

        Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Edit Tickers'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: const TextStyle(color: secondaryColor),
              decoration: const InputDecoration(
                labelText: 'Symbol',
                border: OutlineInputBorder(
                  
                ),
              ),
              initialValue: widget.data.symbol.toString(),
              onChanged: (value) {
                widget.data.symbol = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: const TextStyle(color: secondaryColor),
              
              onChanged: (value) {
                widget.data.quantity = int.parse(value);
              },
              decoration: const InputDecoration(

                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              initialValue: widget.data.quantity.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: const TextStyle(color: secondaryColor),
              onChanged: (value) {
                widget.data.buyPercentage = double.parse(value);
              },
              decoration: const InputDecoration(
                labelText: 'Buy Percentage',
                border: OutlineInputBorder(),
              ),
              initialValue: widget.data.buyPercentage.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              
              style: const TextStyle(color: secondaryColor ,
               
              ),


              
              onChanged: (value) {
                widget.data.sellPercentage = double.parse(value);
              },
              decoration: const InputDecoration(
                labelText: 'Sell Percentage',
                border: OutlineInputBorder(),
              ),
              initialValue: widget.data.sellPercentage.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            //  full width button elveated buttion
            ElevatedButton(
              onPressed: () async {
                log("message");
                await widget.mycontroller.updateTickers({
                  "_id": widget.data.id,
                  "symbol": widget.data.symbol,
                  "quantity": widget.data.quantity,
                  "buyPercentage": widget.data.buyPercentage,
                  "sellPercentage": widget.data.sellPercentage,
                  "running": widget.data.running,
                  "fixed": widget.data.fixed
                });

                // close the bottom sheet

                await widget.mycontroller.getTickerDetails();
                Navigator.pop(context);
                
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: secondaryColor,
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Obx(
                () => widget.mycontroller.updateLoad == true
                    ?const  SizedBox(
                        height: 20,
                        width: 20,
                        child:  CircularProgressIndicator()
                      )
                    : const Text(
                        'Save',
                        style: TextStyle(color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold

                        ),
                      ),
              ),
            ),

            // select dropdown
          ],
        ),
      ),
    );
  }
}
