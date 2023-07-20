import 'package:auth/src/features/authentication/screens/activity/categories/mental_stimulation.dart';
import 'package:auth/src/features/authentication/screens/activity/categories/physical_activity.dart';
import 'package:auth/src/features/authentication/screens/activity/categories/relaxation_joy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../calender/create_note/notes.dart';
import 'categories/emotional_wellbeing.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(colors: [
        Color(0xFF8EC5FC),
        Color(0xFFE0C3FC),
      ]),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Activity',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildCategoryRow(
              context,
              'Physical Activities',
              'assets/images/otdoor.png',
                  () {
                    Get.to(() => PhysicalActivityPage());
                print('Pressed Category 1');
              },
            ),
            buildCategoryRow(
              context,
              'Mental Stimulation',
              'assets/images/creative.png',
                  () {
                    Get.to(() => MentalStimulationPage());
                print('Pressed Category 2');
              },
            ),
            buildCategoryRow(
              context,
              ' Emotional Well-being',
              'assets/images/social.png',
                  () {
                    Get.to(() => EmotionalWellbeingPage());
                print('Pressed Category 3');
              },
            ),
            buildCategoryRow(
              context,
              'Relaxation and Joy',
              'assets/images/relax.png',
                  () {
                    Get.to(() => RelaxationAndJoyPage());
                print('Pressed Category 4');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryRow(
      BuildContext context, String category, String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
            ),
            SizedBox(width: 16.0),
            Text(
              category,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
