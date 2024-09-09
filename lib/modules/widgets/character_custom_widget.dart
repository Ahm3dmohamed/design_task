import 'package:design_task/modules/layout/tabs/character.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 10),
                child: Text(
                  txt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.5,
                    viewportFraction: 0.6,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {},
                  ),
                  items: imgPaths.map((imgPath) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Character(
                              index: selectedIndex,
                            ),
                          ),
                        );
                      },
                      child: Image.network(
                        imgPath,
                        fit: BoxFit.cover,
                        height: height * 0.4,
                        width: width * 0.55,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) {
                            return child;
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                              child: Icon(Icons.error, color: Colors.red));
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
