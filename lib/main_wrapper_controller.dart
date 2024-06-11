

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainWrapperController extends GetxController {
  final _currentIndex = 0.obs;
  final _pageController = PageController().obs;

  int get currentIndex => _currentIndex.value;
  PageController get pageController => _pageController.value;

  void changePage(int index) {
    _currentIndex.value = index;
    _pageController.value.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
