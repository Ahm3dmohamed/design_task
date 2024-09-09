import 'package:flutter/material.dart';
import 'package:design_task/modules/layout/tabs/agent_tab.dart';
import 'package:design_task/modules/widgets/map_widget.dart';
import 'package:design_task/modules/widgets/weapon_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    AgentsTab(),
    MapWidget(),
    WeaponWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 27, 27),
        appBar: AppBar(
          title: const Text('Valorant Data'),
          backgroundColor: const Color.fromARGB(255, 29, 27, 27),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/Logo Icon.png"),
              ],
            ),
            Image.asset("assets/img/Logo Text.png"),
            const SizedBox(height: 44),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTabButton("AGENTS", 0),
                buildTabButton("MAPS", 1),
                buildTabButton("WEAPONS", 2),
              ],
            ),
            Expanded(child: _pages[_currentIndex]),
          ],
        ),
      ),
    );
  }

  Widget buildTabButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _currentIndex == index ? Colors.red : Colors.transparent,
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
