import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';


import '../../../../../utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // mainbarkAi (5:12)
        width: double.infinity,
        height: 68*fem,
        child: Stack(
          children: [
            Positioned(
              // vectorgKG (5:11)
              left: 288*fem,
              top: 14*fem,
              child: Align(
                child: SizedBox(
                  width: 18*fem,
                  height: 18*fem,
                  child: Image.asset(
                    'assets/page-1/images/vector.png',
                    width: 18*fem,
                    height: 18*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // mainbarBWv (1:24)
              left: 0*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 428*fem,
                  height: 68*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xffe7e2fc),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // chatbot686 (1:25)
              left: 249*fem,
              top: 13*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
                width: 30*fem,
                height: 49*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // messagecircleCB8 (5:15)
                      margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 11*fem),
                      width: 18*fem,
                      height: 18*fem,
                      child: Image.asset(
                        'assets/page-1/images/message-circle.png',
                        width: 18*fem,
                        height: 18*fem,
                      ),
                    ),
                    Text(
                      // chath7t (1:27)
                      'Chat',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.1725*ffem/fem,
                        color: Color(0xff8e61da),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // nutrition1uG (1:28)
              left: 132*fem,
              top: 16.3737487793*fem,
              child: Container(
                width: 56*fem,
                height: 45.63*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // ciheartoutlineY8W (1:29)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 8.37*fem),
                      width: 23.33*fem,
                      height: 20.26*fem,
                      child: Image.asset(
                        'assets/page-1/images/ci-heart-outline.png',
                        width: 23.33*fem,
                        height: 20.26*fem,
                      ),
                    ),
                    Text(
                      // nutritionEn2 (1:30)
                      'Nutrition',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.1725*ffem/fem,
                        color: Color(0xff8e61da),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // journalyUi (1:34)
              left: 344*fem,
              top: 14*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 0*fem),
                width: 44*fem,
                height: 48*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // calendarVCA (5:17)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6*fem, 9*fem),
                      width: 18*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/page-1/images/calendar.png',
                        width: 18*fem,
                        height: 20*fem,
                      ),
                    ),
                    Text(
                      // journalQ4E (1:36)
                      'journal',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.1725*ffem/fem,
                        color: Color(0xff8e61da),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}