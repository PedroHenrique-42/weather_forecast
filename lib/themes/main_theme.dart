import 'package:flutter/material.dart';

ThemeData mainLightTheme = ThemeData(
  cardColor: const Color.fromRGBO(235, 235, 235, 1),
  fontFamily: "Poppins",
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData mainDarkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(primary: Colors.grey),
  primaryColor: Colors.grey,
  fontFamily: "Poppins",
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);
