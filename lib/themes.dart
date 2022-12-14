import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';

ThemeData get mythosTheme {
  return ThemeData(
    inputDecorationTheme: kDefaultInputDecorationTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: const Color.fromRGBO(147, 90, 162, 1),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    /*  textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black),
      headline2: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),*/
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );
}
