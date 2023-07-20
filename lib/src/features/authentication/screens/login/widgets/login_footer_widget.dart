import 'package:auth/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/text_strings.dart';


class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              Get.to(() => const SignUpScreen());
            },
            child: Text.rich(TextSpan(
              text: tDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                    text: tSignup, style: TextStyle(color: Colors.lightBlue))
              ],
            ))),
      ],
    );
  }
}
