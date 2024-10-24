import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeClass {
  Color lightPrimaryColor = HexColor('#20f7e5');
  Color darkPrimaryColor = HexColor('#0c3d39');
  Color secondaryColor = HexColor('#fcfafa');
  Color accentColor = HexColor('#d8de71');

  static ThemeData lightTheme = ThemeData(
    primaryColor: _themeClass.darkPrimaryColor,
    appBarTheme: AppBarTheme(backgroundColor: _themeClass.lightPrimaryColor),
    colorScheme: const ColorScheme.light().copyWith(
      primary: _themeClass.lightPrimaryColor,
      secondary: _themeClass.secondaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.dark().copyWith(
          primary: _themeClass.secondaryColor,
          secondary: _themeClass.secondaryColor));
}

ThemeClass _themeClass = ThemeClass();
