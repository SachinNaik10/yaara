import 'package:auth/src/features/authentication/screens/dashbaord/dashboard.dart';
import 'package:auth/src/features/authentication/screens/main_page/main_page.dart';
import 'package:auth/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:auth/src/features/authentication/screens/profile_form_screen/profile_form_screen.dart';
import 'package:auth/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 5));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => OnBoardingScreen()) :
    Get.offAll(() => const MainPage());
  }

  
  //signup
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() =>  ProfileFormScreen()) : Get //here add profile form screen
          .offAll(() => OnBoardingScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){}
    catch(_){}
  }

  Future<void> logout() async => await _auth.signOut();
}