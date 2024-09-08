import 'package:design_task/modules/layout/tabs/agent_tab.dart';
import 'package:design_task/modules/layout/tabs/character.dart';
import 'package:design_task/modules/layout/tabs/home_screen.dart';
import 'package:design_task/modules/layout/splash_screen.dart';
import 'package:design_task/modules/widgets/map_widget.dart';
import 'package:design_task/modules/widgets/weapon_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        WeaponWidget.routeName: (_) => WeaponWidget(),
        MapWidget.routeName: (_) => MapWidget(),
        AgentsTab.routeName: (_) => AgentsTab(),
      },
    );
  }
}
