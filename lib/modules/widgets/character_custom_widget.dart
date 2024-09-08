import 'package:flutter/material.dart';
import 'package:design_task/modules/layout/tabs/character.dart';

class CharacterCustomWidget extends StatefulWidget {
  final String imgPath;
  final String txt;
  final int selectedIndex;
  final List<Color> color;

  CharacterCustomWidget({
    required this.selectedIndex,
    required this.txt,
    required this.color,
    required this.imgPath,
    super.key,
  });

  @override
  State<CharacterCustomWidget> createState() => _CharacterCustomWidgetState();
}

class _CharacterCustomWidgetState extends State<CharacterCustomWidget> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: h * 0.40,
              width: w * 0.50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(72),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(80),
                ),
                gradient: LinearGradient(
                  colors: widget.color,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              top: -60,
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Character(
                          index: widget.selectedIndex,
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    widget.imgPath,
                    height: h * 0.45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text.rich(TextSpan(
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    text: widget.txt,
                  )),
                )),
          ],
        ),
      ],
    );
  }
}
