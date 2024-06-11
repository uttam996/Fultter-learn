// create a new class called MainWrapper
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_flutter_getx/app/modules/Tickers/views/tickers_view.dart';
import 'package:learning_flutter_getx/app/modules/completed/views/completed_view.dart';
import 'package:learning_flutter_getx/app/modules/home/views/home_view.dart';
import 'package:learning_flutter_getx/constansts.dart';



import 'package:learning_flutter_getx/main_wrapper_controller.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  final MainWrapperController controller = Get.put(MainWrapperController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard',style: TextStyle(
          color: secondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 24
          

        
        ),),
        centerTitle: false,
        backgroundColor:  primaryColor,
        
      ),
      backgroundColor:  primaryColor,
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: controller.pageController,
        children: [
          HomeView(),
          CompletedView(),
          TickersView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        backgroundColor: primaryColor,
        selectedItemColor: secondaryColor,
        unselectedItemColor: secondaryColor,
        showSelectedLabels: true,
        


        
       
       
        onTap: controller.changePage,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
            

            icon: Icon(
              Icons.home,
              color: secondaryColor,
            ),
            label: 'Home',

            
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.blur_on,
              color: secondaryColor,
            ),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.hotel,
               color: secondaryColor,
            ),
            label: 'Tickers',
          ),
        ],
      ),
    );
  }
}
