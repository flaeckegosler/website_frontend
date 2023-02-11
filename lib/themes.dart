import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';

ThemeData get mythosTheme {
  return ThemeData(
    inputDecorationTheme: kDefaultInputDecorationTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: const Color.fromRGBO(151, 28, 28, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(151, 28, 28, 1),
    ),
    splashColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.white)
        .copyWith(background: Colors.white),
  );
}
