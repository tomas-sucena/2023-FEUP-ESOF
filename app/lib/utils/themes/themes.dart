import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // colors
  primaryColor: const Color.fromRGBO(233, 161, 136, 1),
  scaffoldBackgroundColor: const Color.fromRGBO(252, 252, 249, 1.0),
  shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),

  // UI elements
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: const Color.fromRGBO(247, 233, 165, 1.0),
    selectedItemColor: const Color.fromRGBO(36, 38, 53, 1.0),
  ),

  // text
  fontFamily: 'Jost',
  textTheme: const TextTheme(
    displayLarge: const TextStyle(
      fontSize: 50,
      color: const Color.fromRGBO(101, 101, 100, 1.0),
    ),
    displayMedium: const TextStyle(
      fontSize: 28,
      color: const Color.fromRGBO(126, 126, 125, 1.0),
    ),
    displaySmall: const TextStyle(
      fontSize: 20,
      color: const Color.fromRGBO(126, 126, 125, 1.0),
      height: 1.2,
    ),
    bodySmall: const TextStyle(
      fontSize: 16,
      color: const Color.fromRGBO(126, 126, 125, 1.0),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  applyElevationOverlayColor: true,

  // colors
  primaryColor: const Color.fromRGBO(233, 161, 136, 1),
  scaffoldBackgroundColor: const Color.fromRGBO(26, 27, 46, 1.0),
  shadowColor: const Color.fromRGBO(255, 255, 255, 0.25),

  // UI elements
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: const Color.fromRGBO(247, 233, 165, 1.0),
    selectedItemColor: const Color.fromRGBO(36, 38, 53, 1.0),
  ),

  // text
  fontFamily: 'Jost',
  textTheme: const TextTheme(
    displayLarge: const TextStyle(
      fontSize: 50,
      color: const Color.fromRGBO(162, 163, 170, 1.0),
    ),
    displayMedium: const TextStyle(
      fontSize: 28,
      color: const Color.fromRGBO(140, 140, 150, 1.0),
    ),
    displaySmall: const TextStyle(
      fontSize: 20,
      color: const Color.fromRGBO(140, 140, 150, 1.0),
      height: 1.2,
    ),
    bodySmall: const TextStyle(
      fontSize: 16,
      color: const Color.fromRGBO(140, 140, 150, 1.0),
    ),
  ),
);
