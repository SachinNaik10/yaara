import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../profile/widgets/profile_menu.dart';
class ReminderScreen extends StatelessWidget {
   ReminderScreen({Key? key}) : super(key: key);
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
          title: Text("Reminders"),
        ),
        body: Container(
          child: Column(
            children: [
              ProfileMenuWidget(title: 'MEDITATION REMINDERS', icon: Icons.snowshoeing, onPress: () {  }, endIcon: false, ),
              // ProfileMenuWidget(title: 'WAKEUP REMINDERS', icon: Icons.alarm, onPress: () {  }, endIcon: false, ),
            ],
          ),
        ),
      ),
    );;
  }
}
