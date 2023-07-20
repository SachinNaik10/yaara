import 'package:auth/src/common_widgets/form/form_header_widget.dart';
import 'package:auth/src/constants/colors.dart';
import 'package:auth/src/constants/image_strings.dart';
import 'package:auth/src/constants/sizes.dart';
import 'package:auth/src/constants/text_strings.dart';
import 'package:auth/src/features/authentication/screens/login/login_screen.dart';
import 'package:auth/src/features/authentication/screens/profile_form_screen/profile_form_screen.dart';
import 'package:auth/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: LinearGradient(colors: [
          Color(0xFF8EC5FC),
          Color(0xFFE0C3FC),
        ]),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                    image: tWelcomeScreenImage,
                    title: tSignUpTitle,
                    subTitle: tSignUpSubTitle),

                SignUpForm(),

                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.to(() => ProfileFormScreen());
                        },
                        child: Text.rich(TextSpan(
                          text: tAlreadyHaveAnAccount,
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                                text: tLogin,
                                style: TextStyle(color: Colors.lightBlue))
                          ],
                        ))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
