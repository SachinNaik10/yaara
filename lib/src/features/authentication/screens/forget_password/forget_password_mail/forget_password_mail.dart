import 'package:auth/src/common_widgets/form/form_header_widget.dart';
import 'package:auth/src/constants/image_strings.dart';
import 'package:auth/src/constants/text_strings.dart';
import 'package:auth/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                SizedBox(
                  height: tDefaultSize  * 4 ,
                ),

                FormHeaderWidget(image: tWelcomeScreenImage, title: tWelcomeTitle, subTitle: tWelcomeSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween:  30.0,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: tFormHeight,
                ),
                Form(child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmail,
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: () {
                      Get.to(() => OTPScreen());
                    }, child: Text(tNext)))

                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
