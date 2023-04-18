import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // colors
  scaffoldBackgroundColor: const Color.fromRGBO(252, 252, 249, 1),
  
  // UI elements
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: const Color.fromRGBO(247, 233, 165, 1),
    selectedItemColor: const Color.fromRGBO(36, 38, 53, 1),
  ),
  
  // text
  fontFamily: 'Jost',
);

ThemeData darkTheme = ThemeData(
  // colors
  scaffoldBackgroundColor: const Color.fromRGBO(26, 27, 46, 1.0),

  // UI elements
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: const Color.fromRGBO(247, 233, 165, 1),
    selectedItemColor: const Color.fromRGBO(36, 38, 53, 1),
  ),

  // text
  fontFamily: 'Jost',
);
