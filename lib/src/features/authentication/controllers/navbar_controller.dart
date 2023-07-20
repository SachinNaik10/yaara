import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavbarWrapperController extends GetxController{
  late PageController pageController;

  //variable for changing index of bottom appbar
  RxInt currentPage = 0.obs;

  void goToTab(int page){
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  @override
  void onInit() {
   pageController = PageController(initialPage: 0);
    super.onInit();
  }
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}