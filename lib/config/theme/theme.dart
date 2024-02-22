import 'package:flutter/material.dart';

class ThemeClass {
  static const Color brownColor = Color(0xff7A4537);
  static const Color lightPrimaryColor = Color(0xFFFFFFFF);
  static const Color darkPrimaryColor = Color(0xFF202020);
  static const Color secondaryColor = Color(0xFFFF8B6A);
  static const Color accentColor = Color(0xFFFFD2BB);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(brownColor),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: lightPrimaryColor,
      secondary: secondaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(brownColor),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryColor,
    ),
  );
}