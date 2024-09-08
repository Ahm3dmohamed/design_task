import 'package:flutter/material.dart';

class AbilitiesIcon extends StatelessWidget {
  String images;
  AbilitiesIcon(this.images);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Image.asset(
          images,
          scale: 1.8,
        ));
  }
}
