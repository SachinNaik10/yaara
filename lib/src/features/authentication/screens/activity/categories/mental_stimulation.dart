import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class MentalStimulationPage extends StatelessWidget {
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
          'Mental Stimulation',
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
            buildActivityRow(Icons.edit, 'Take a break and do a crossword or puzzle.'),
            buildActivityRow(Icons.brush, 'Spend 15 minutes doing a creative activity, like painting or drawing.'),
            buildActivityRow(Icons.book, 'Take a break from screens and read a chapter of a book.'),
            buildActivityRow(Icons.mood, 'Do a quick body scan meditation to check in with yourself.'),
            buildActivityRow(Icons.playlist_add_check, 'Spend a few minutes organizing your to-do list for the day.'),
            buildActivityRow(Icons.videogame_asset, 'Spend some time doing a brain teaser or Sudoku puzzle.'),
            buildActivityRow(Icons.headset, 'Listen to a podcast or audiobook that inspires you.'),
            buildActivityRow(Icons.games, 'Spend some time doing a puzzle or brain teaser game.'),
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
