import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';

ThemeData get myTheme {
  return ThemeData(
    useMaterial3: true,
    inputDecorationTheme: kDefaultInputDecorationTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: const Color.fromRGBO(151, 28, 28, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(151, 28, 28, 1),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    splashColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.white)
        .copyWith(background: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(151, 28, 28, 1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
