import 'package:auth/src/constants/colors.dart';
import 'package:auth/src/constants/image_strings.dart';
import 'package:auth/src/constants/sizes.dart';
import 'package:auth/src/constants/text_strings.dart';
import 'package:auth/src/features/authentication/screens/login/login_screen.dart';
import 'package:auth/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.platformBrightnessOf;
    final isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: LinearGradient(colors: [
          Color(0xffffdcbd),
          Color(0xffffdcbd),
        ]),
        body: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(tWelcomeScreenImage),
                height: height * 0.5,
              ),
              Text(tWelcomeTitle,
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(
                height: height * 0.2,
              ),
              Text(
                tWelcomeSubTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const SignUpScreen());
                          },
                          child: Text(tSignup))),
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: tSecondaryColor,
                            side: BorderSide(color: tSecondaryColor),
                            padding:
                                EdgeInsets.symmetric(vertical: tButtonHeight),
                          ),
                          child: Text(tLogin))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
