import 'package:design_task/modules/layout/tabs/character.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CharacterCustomWidget extends StatelessWidget {
  final int selectedIndex;
  final String txt;
  final List<String> imgPaths;
  final List<Color> color;

  CharacterCustomWidget({
    required this.selectedIndex,
    required this.txt,
    required this.imgPaths,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: height * 0.45,
          width: width * 0.55,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(72),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(80),
            ),
            gradient: LinearGradient(
              colors: color,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                  items: imgPaths.asMap().entries.map((entry) {
                    int index = entry.key;
                    String imgPath = entry.value;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Character(
                              txt: txt,
                              imgPaths: imgPaths,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: -85,
                            bottom: 12,
                            child: Image.network(
                              imgPath,
                              fit: BoxFit.cover,
                              height: height,
                              width: width * 0.6,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) {
                                  return child;
                                } else {
                                  return Skeletonizer(child: child);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80, bottom: 4),
                child: Text(
                  txt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Valorant",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
