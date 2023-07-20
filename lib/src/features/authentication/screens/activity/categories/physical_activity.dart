import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class PhysicalActivityPage extends StatelessWidget {
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
          'Physical Activities',
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
            buildActivityRow(Icons.directions_walk, 'Go for a 10-minute walk outside.'),
            buildActivityRow(Icons.accessibility, 'Do a quick stretching routine.'),
            buildActivityRow(Icons.nightlight_outlined, 'Take a power nap for 20 minutes.'),
            buildActivityRow(Icons.fitness_center, 'Do a mini workout routine, like squats, push-ups, and sit-ups.'),
            buildActivityRow(Icons.spa, 'Do a quick yoga routine to stretch and relax your body.'),
            buildActivityRow(Icons.pets, 'Take a break and play with a pet or cuddle a stuffed animal.'),
            buildActivityRow(Icons.create, 'Spend some time doing a hobby you enjoy, like knitting or gardening.'),
            buildActivityRow(Icons.phone_android, 'Take a few minutes to do a digital detox and disconnect from technology.'),
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
