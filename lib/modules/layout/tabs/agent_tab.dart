import 'package:design_task/modules/widgets/character_custom_widget.dart';
import 'package:flutter/material.dart';

class AgentsTab extends StatelessWidget {
  static const String routeName = "AgentsTab";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        padding: const EdgeInsets.only(top: 88),
        scrollDirection: Axis.horizontal,
        children: [
          CharacterCustomWidget(
            selectedIndex: 0,
            txt: "Fade",
            imgPath: "assets/img/fade.png",
            color: const [
              Color(0xff66376C),
              Color(0xffB1414C),
            ],
          ),
          const SizedBox(width: 16),
          CharacterCustomWidget(
            selectedIndex: 1,
            txt: "Gekko",
            imgPath: "assets/img/gekko.png",
            color: const [
              Color(0xff3A7233),
              Color(0xffC7F458),
            ],
          ),
          const SizedBox(width: 16),
          CharacterCustomWidget(
            selectedIndex: 2,
            txt: "Deadlock",
            imgPath: "assets/img/deadlock.png",
            color: const [
              Color(0xffBCC2FF),
              Color(0xff22224B),
            ],
          ),
          const SizedBox(width: 16),
          CharacterCustomWidget(
            selectedIndex: 3,
            txt: "Breach",
            imgPath: "assets/img/kaya.png",
            color: const [
              Color(0xffFF9C33),
              Color(0xff44412E),
            ],
          ),
        ],
      ),
    );
  }
}
