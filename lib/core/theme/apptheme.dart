import 'package:flutter/material.dart';

class Apptheme {
  ThemeData myTheme = ThemeData(
    fontFamily: "Valorant",
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: "Valorant",
            fontStyle: FontStyle.italic)),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: "Valorant",
            fontStyle: FontStyle.italic)),
  );
}
