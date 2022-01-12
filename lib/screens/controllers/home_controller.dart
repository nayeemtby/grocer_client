import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  // BottomNavigationBar Stuff
  RxInt currentNavigationTab = 0.obs;
  void bottomNavigationBarOnTap(int num) {
    currentNavigationTab.value = num;
    pageController.jumpToPage(num);
  }

  // PageView Stuff
  final PageController pageController = PageController();
}
