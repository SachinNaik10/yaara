import 'package:auth/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:auth/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:auth/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:auth/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  //we dont want user to access theme using instance of the class so we have to make it pvt
  TAppTheme._(); //pvt karta

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  ) ;
  //   brightness: Brightness.light,
  //   primarySwatch: const MaterialColor(0xFFFFE200, <int, Color> {
  //     50 :Color(0x1AFFE200),
  //     100 :Color(0x33FFE200),
  //     200 :Color(0x4DFFE200),
  //     300 :Color(0x66FFE200),
  //     400 :Color(0x80FFE200),
  //     500 :Color(0xFFFFE200),
  //     600 :Color(0x99FFE200),
  //     700 :Color(0xB3FFE200),
  //     800 :Color(0xCCFFE200),
  //     900 :Color(0x1E6FFE200)
  //   }),

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      textTheme: TTextTheme.lightTextTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
