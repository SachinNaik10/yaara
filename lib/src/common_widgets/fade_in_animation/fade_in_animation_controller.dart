import 'package:auth/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:auth/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FadeInAnimationController extends GetxController {

  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;


  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 5000));
    animate.value = true;

    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(WelcomeScreen());
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome));
  }
}