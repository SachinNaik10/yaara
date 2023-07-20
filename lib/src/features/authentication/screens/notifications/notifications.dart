import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../profile/widgets/profile_menu.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({Key? key}) : super(key: key);
   // var isDark= MediaQuery.of(context).platformBrightness == Brightness.dark;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: LinearGradient(colors: [
          Color(0xFF8EC5FC),
          Color(0xFFE0C3FC),
        ]),
        appBar: AppBar(
          title: Text("Notification"),
        ),
        body: Container(
          child: Column(
            children: [
              ProfileMenuWidget(title: 'RECOMMENDATIONS', icon: Icons.recommend, onPress: () {  }, endIcon: false, ),
              ProfileMenuWidget(title: 'MINDFUL RECOMMENDATIONS', icon: Icons.health_and_safety_outlined, onPress: () {  }, endIcon: false, ),
            ],
          ),
        ),
      ),
    );
  }
}
