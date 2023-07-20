

import 'package:auth/src/features/authentication/screens/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

signUpUser(String userName, String userEmail, String userPassword)async{
  User? userid = FirebaseAuth.instance.currentUser;
  try{
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(userid!.uid)
        .set({
      'userEmail': userEmail,
      'userPassword': userPassword,
      'createdAt': DateTime.now(),
      'userId': userid.uid,
    }).then((value) =>{
      FirebaseAuth.instance.signOut(),
      Get.to(() => LoginScreen())
    });
  }on FirebaseAuthException catch(e){
    print("error $e");
  }

}
