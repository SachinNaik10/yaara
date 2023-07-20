import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
class HelplineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(colors: [
        Color(0xFF8EC5FC),
        Color(0xFFE0C3FC),
      ]),
      appBar: AppBar(
        title: Text('Helplines'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('National Suicide Prevention Lifeline (USA)'),
            subtitle: Text('Call 1-800-273-TALK (8255)'),
            onTap: () => launch('tel:18002738255'),
          ),
          ListTile(
            title: Text('Crisis Text Line (USA)'),
            subtitle: Text('Text HOME to 741741'),
            onTap: () => launch('sms:741741'),
          ),
          ListTile(
            title: Text('Samaritans UK'),
            subtitle: Text('Call 116 123'),
            onTap: () => launch('tel:116123'),
          ),
          ListTile(
            title: Text('National Alliance on Mental Illness (NAMI)'),
            subtitle: Text('Visit www.nami.org'),
            onTap: () => launch('https://www.nami.org'),
          ),
          ListTile(
            title: Text('Mental Health America'),
            subtitle: Text('Visit www.mhanational.org'),
            onTap: () => launch('https://www.mhanational.org'),
          ),
          ListTile(
            title: Text('The Trevor Project (LGBTQ+)'),
            subtitle: Text('Visit www.thetrevorproject.org'),
            onTap: () => launch('https://www.thetrevorproject.org'),
          ),
          ListTile(
            title: Text('ReachOut'),
            subtitle: Text('Visit au.reachout.com'),
            onTap: () => launch('https://au.reachout.com'),
          ),
          ListTile(
            title: Text('BetterHelp'),
            subtitle: Text('Visit www.betterhelp.com'),
            onTap: () => launch('https://www.betterhelp.com'),
          ),
          ListTile(
            title: Text('7 Cups'),
            subtitle: Text('Visit www.7cups.com'),
            onTap: () => launch('https://www.7cups.com'),
          ),
          ListTile(
            title: Text('Your Life Counts'),
            subtitle: Text('Visit www.yourlifecounts.org'),
            onTap: () => launch('https://www.yourlifecounts.org'),
          ),
        ],
      ),
    );
  }
}
