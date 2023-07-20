import 'package:auth/src/features/authentication/models/user_model.dart';
import 'package:auth/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../repository/user_repository/user_repository.dart';

class ProfileController extends GetxController{
static ProfileController get instance => Get.find();




  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
///Get user Email and pass to User Repository to fetch user record
//email, name ,uid
getUserData(){
   final email = _authRepo.firebaseUser.value?.email;
   if(email!= null){
     return _userRepo.getUserDetails(email);
   }else{
     Get.snackbar("Error", "Login to continue");
   }
 }

 //fetch list of user records
// Future<List<UserModel>> getAllUsers()async =>await _userRepo.allUsers();
//updaterecords
updateRecord(UserModel user) async{
  await _userRepo.updateRecord(user);
}
}
