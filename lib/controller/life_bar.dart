import 'dart:math';
import 'package:flutter/material.dart';
import '../model/fighter.dart';


class LifeBar extends StatelessWidget{
  final Fighter fighter;
  final bool reverse;
  final Color color;

  const LifeBar(this.fighter, this.reverse, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 100,
            height: 12,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(reverse ? pi : 0),
            child: LinearProgressIndicator(
              color: color,
              backgroundColor: Colors.black,
              value: fighter.life / fighter.maxLife,
            ),
          ),
        ),
      ],
    );
  }
}
