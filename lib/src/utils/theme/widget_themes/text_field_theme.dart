import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_strings.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      prefixIconColor: tSecondaryColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      floatingLabelStyle: TextStyle(color: tSecondaryColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: tSecondaryColor)));
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      prefixIconColor: tPrimaryColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      floatingLabelStyle: TextStyle(color: tPrimaryColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: tPrimaryColor)));
}
