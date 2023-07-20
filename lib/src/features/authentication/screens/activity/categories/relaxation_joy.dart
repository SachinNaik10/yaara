import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class RelaxationAndJoyPage extends StatelessWidget {
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
          'Relaxation and Joy',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildActivityRow(Icons.airline_seat_flat, 'Take five minutes to practice deep breathing.'),
            buildActivityRow(Icons.music_note, 'Listen to your favorite uplifting song.'),
            buildActivityRow(Icons.ondemand_video, 'Watch a funny video or movie clip to boost your mood.'),
            buildActivityRow(Icons.visibility, 'Practice a brief visualization exercise for relaxation.'),
            buildActivityRow(Icons.phone, 'Take a break and call or text a loved one for a quick chat.'),
            buildActivityRow(Icons.accessibility_new, 'Practice a progressive muscle relaxation exercise to release tension.'),
            buildActivityRow(Icons.local_drink, 'Take a break and drink a glass of water to stay hydrated.'),
            buildActivityRow(Icons.local_cafe, 'Take a break and enjoy a cup of herbal tea for relaxation.'),
          ],
        ),
      ),
    );
  }

  Widget buildActivityRow(IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(iconData, color: Colors.blue),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
