import 'package:flutter/material.dart';

class MapWidget extends StatefulWidget {
  static const String routeName = "MapWidget";

  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Map"));
  }
}
