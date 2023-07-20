import 'package:flutter/material.dart';
import 'package:auth/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

//WHO WILL FRIGGIN ADD GOOGLE FOTNTS HERREE NO WONDER NO FONT WAS USED
class TTextTheme{
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme();
  static TextTheme darkTextTheme = TextTheme();
}

class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
  );


}