import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:design_task/modules/layout/tabs/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Image.asset(
        "assets/img/splash_screen.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
