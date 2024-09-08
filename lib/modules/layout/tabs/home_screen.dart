import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_task/modules/widgets/map_widget.dart';
import 'package:design_task/modules/widgets/weapon_widget.dart';
import 'package:flutter/material.dart';
import 'package:design_task/modules/layout/tabs/agent_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    AgentsTab(),
    const Center(child: Text('Maps')),
    const Center(child: Text('Weapons')),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 27, 27),
        appBar: AppBar(
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
            const SizedBox(
              height: 6,
            ),
            Image.asset("assets/img/Logo Text.png"),
            const SizedBox(height: 44),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _setCarouselIndex(0);
                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   AgentsTab.routeName,
                    //   (route) => false,
                    // );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          _currentIndex == 0 ? Colors.red : Colors.transparent,
                    ),
                    child: const Text(
                      "AGENTS",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _setCarouselIndex(1);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapWidget(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          _currentIndex == 1 ? Colors.red : Colors.transparent,
                    ),
                    child: const Text(
                      "MAPS",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _setCarouselIndex(2);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      WeaponWidget.routeName,
                      (route) => false,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          _currentIndex == 2 ? Colors.red : Colors.transparent,
                    ),
                    child: const Text(
                      "WEAPONS",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CarouselSlider(
              items: _pages,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6,
                initialPage: _currentIndex,
                enlargeCenterPage: true,
                autoPlay: false,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setCarouselIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
