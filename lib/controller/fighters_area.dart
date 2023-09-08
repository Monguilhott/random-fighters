import 'dart:math';
import 'package:flutter/material.dart';
import '../model/fighter.dart';

class FightersArea extends StatelessWidget {
  const FightersArea(this.fighterOne, this.fighterTwo, {super.key});
  final Fighter fighterOne;
  final Fighter fighterTwo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            fighterOne.image,
            scale: 0.45,
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: Image.asset(
              fighterTwo.image,
              scale: 0.45,
            ),
          ),
        ],
      ),
    );
  }
}
