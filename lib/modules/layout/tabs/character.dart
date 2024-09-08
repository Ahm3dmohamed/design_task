// ignore_for_file: prefer_const_constructors

import 'package:design_task/core/theme/apptheme.dart';
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
    ThemeData theme = Theme.of(context);
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
              backgroundColor: Colors.transparent,
              // leading: IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.arrow_back,
              //       color: Colors.white,
              //     )),
              title: Text("${labels[widget.index]}",
                  style: theme.textTheme.bodyMedium),
              centerTitle: true,
              actions: [
                Image.asset(
                  "assets/img/displayicon1.png",
                  scale: .8,
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
                alignment: Alignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 34, bottom: 28),
                      child: Image.asset(
                        "assets/img/background.png",
                        width: 150,
                        height: 250,
                      )),
                  Positioned(
                      bottom: -5,
                      top: -44,
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
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
