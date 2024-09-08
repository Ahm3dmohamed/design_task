import 'package:flutter/material.dart';

class WeaponWidget extends StatefulWidget {
  static const String routeName = "WeaponWidget";
  const WeaponWidget({super.key});

  @override
  State<WeaponWidget> createState() => _WeaponWidgetState();
}

class _WeaponWidgetState extends State<WeaponWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Weapons....!"),
    );
  }
}
