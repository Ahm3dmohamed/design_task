// ignore_for_file: prefer_const_constructors

import 'package:design_task/modules/widgets/abilities_icon.dart';
import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  final int index;
  static const String routeName = "Character";

  Character({required this.index});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  List<String> labels = [
    "Fade",
    "Gekko",
    "Deadlock",
    "Breach",
  ];

  List<String> images = [
    "assets/img/fade.png",
    "assets/img/gekko.png",
    "assets/img/deadlock.png",
    "assets/img/kaya.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF163555),
              Color(0xFF372D2B),
              Color(0xFF7B4D21),
              Color(0xFFFFCE6F),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              leading: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              title: Text(
                "${labels[widget.index]}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              centerTitle: true,
              actions: [
                Image.asset(
                  "assets/img/displayicon1.png",
                  scale: 1,
                  width: 44,
                  height: 89,
                ),
                SizedBox(
                  width: 18,
                ),
              ]),
          body: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Image.asset(
                        "assets/img/chara_background.png",
                        width: 300,
                        height: 350,
                      )),
                  Positioned(
                      bottom: 0,
                      top: -55,
                      child: Container(
                          // height: 420,
                          // width: 300,
                          child: Image.asset(
                        images[widget.index],
                      ))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 5),
                child: Row(
                  children: const [
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 18,
                ),
                child: Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Well-dressed and well-armed, French weapons designer Chamber expels aggressors with deadly precision. He leverages his custom arsenal to hold the line and pick off enemies from afar, with a contingency built for every plan.",
                        maxLines: 8,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: Row(
                  children: const [
                    Text(
                      "abilities",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                AbilitiesIcon("assets/img/displayicon4.png"),
                AbilitiesIcon("assets/img/displayicon5.png"),
                AbilitiesIcon("assets/img/displayicon 3.png"),
                AbilitiesIcon("assets/img/displayicon2.png"),
              ]),
            ],
          ),
        ));
  }
}
