import 'package:auth/src/features/authentication/screens/dashbaord/dashboard.dart';
import 'package:auth/src/features/authentication/screens/main_page/main_page.dart';
import 'package:auth/src/repository/authentication_repository/authentication_repository.dart';
import 'package:auth/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/user_model.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //call function from design and it will do the rest
  void registerUser(String email, String password){
    String? error =
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if (error !=  null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future <void> createUser(UserModel user, String email, String password, Null Function(dynamic success) param3) async{
    await userRepo.createUser(user);
    String? error =
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if (error !=  null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }

    // AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
  }
}