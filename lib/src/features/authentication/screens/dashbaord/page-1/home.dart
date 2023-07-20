import 'package:auth/src/features/authentication/screens/moodtracker/features/mood_records/presentation/mood_log/mood_log_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../activity/activity_screen.dart';
import '../../calender/create_note/notes.dart';
import '../../chatbot/chat_screen.dart';
import '../../health/health.dart';
import '../../suggestions/suggestions.dart';
import '../widgets/appbar.dart';

class HomeScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(colors: [
        Color(0xFF8EC5FC),
        Color(0xFFE0C3FC),
      ]),
      appBar: DashboardAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to Yaara',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: buildFunctionBox(
                    context,
                    'Chatbot',
                    'assets/page-1/images/bubbleimg.png',
                    () {
                      Get.to(() => ChatScreen());
                      print('Pressed Chatbot');
                    },
                  ),
                ),
                Expanded(
                  child: buildFunctionBox(
                    context,
                    'Health',
                    'assets/page-1/images/jump-rope-and-dumbbell-for-workout.png',
                    () {
                      Get.to(() => HealthPage(
                            plan: 'pressed health',
                          ));
                      print('Pressed Health');
                    },
                  ),
                ),
                Expanded(
                  child: buildFunctionBox(
                    context,
                    'Record your mood',
                    'assets/page-1/images/desk-calendar-with-smiley-face-and-good-mood.png',
                        () {
                      Get.to(() => MoodRecordsScreen(
                        plan: 'pressed mood',
                      ));
                      print('Pressed mood');
                    },
                  ),
                ),
                Expanded(
                  child: buildFunctionBox(
                    context,
                    'Your Personal Diary',
                    'assets/page-1/images/desk-calendar-with-smiley-face-and-good-mood.png',
                    () {
                      Get.to(() => NotesScreen());
                      print('Pressed Track your mood');
                    },
                  ),
                ),
                Expanded(
                  child: buildFunctionBox(
                    context,
                    'Video Suggestions',
                    'assets/page-1/images/pulse.png',
                    () {
                      Get.to(() => SuggHomeScreen());
                      print('Pressed Insights');
                    },
                  ),
                ),
                Expanded(
                  child: buildFunctionBox(
                    context,
                    'Activities',
                    'assets/page-1/images/game-console-with-game-icons.png',
                    () {
                      Get.to(() => ActivityPage());
                      print('Pressed Activities');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFunctionBox(
    BuildContext context,
    String text,
    String imagePath,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xffe8e3fc),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
