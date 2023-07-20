import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class EmotionalWellbeingPage extends StatelessWidget {
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
          'Emotional Well-being',
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
            buildActivityRow(Icons.note_add, "Write down three things you're grateful for today."),
            buildActivityRow(Icons.nature_outlined, 'Take a moment to meditate or practice mindfulness.'),
            buildActivityRow(Icons.book, 'Write in your journal or start a gratitude journal.'),
            buildActivityRow(Icons.edit, 'Take a moment to write down your thoughts and feelings.'),
            buildActivityRow(Icons.favorite, 'Take a moment to practice self-compassion and self-care.'),
            buildActivityRow(Icons.celebration, 'Take a moment to reflect on your achievements and celebrate them.'),
            buildActivityRow(Icons.mail, 'Write a letter to yourself, expressing self-love and acceptance.'),
            buildActivityRow(Icons.timelapse, 'Take a moment to appreciate the present moment and practice mindfulness.'),
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
