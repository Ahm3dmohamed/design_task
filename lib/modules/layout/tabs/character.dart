import 'package:design_task/modules/widgets/abilities_icon.dart';
import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  final int index;

  static const String routeName = "Character";

  final String txt;
  final List<String> imgPaths;

  const Character({
    super.key,
    required this.txt,
    required this.imgPaths,
    required this.index,
  });

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff06111C),
              Color(0xff06111C),
              Color(0xff06111C),
              // // Color(0xFFFFCE6F),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              widget.txt,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            centerTitle: true,
            actions: [
              Image.asset(
                "assets/img/displayicon1.png",
                scale: 1,
                width: 44,
                height: 89,
              ),
              const SizedBox(width: 18),
            ],
          ),
          body: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      "assets/img/chara_background.png",
                      width: 300,
                      height: 350,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: -55,
                    child: Image.network(
                      widget.imgPaths[widget.index],
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
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Well-dressed and well-armed, French weapons designer Chamber expels aggressors with deadly precision. He leverages his custom arsenal to hold the line and pick off enemies from afar, with a contingency built for every plan.",
                        maxLines: 8,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              const Padding(
                padding: EdgeInsets.only(left: 12, bottom: 12),
                child: Row(
                  children: [
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
