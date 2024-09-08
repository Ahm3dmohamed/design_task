import 'package:flutter/material.dart';

class Apptheme {
  ThemeData myTheme = ThemeData(
    fontFamily: "font",
    textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: "font",
            fontStyle: FontStyle.italic)),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: "font",
            fontStyle: FontStyle.italic)),
  );
}
