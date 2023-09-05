import 'dart:math';
import 'package:flutter/material.dart';
import 'package:street_fighter/fighter.dart';
import 'life_bar.dart';

class LifeBarArea extends StatelessWidget {
  const LifeBarArea(this.fighterOne, this.fighterTwo, {super.key});
  final Fighter fighterOne;
  final Fighter fighterTwo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    fighterOne.icon,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Text(fighterOne.name,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.none)),
                    ),
                    LifeBar(fighterOne, false, Colors.red),
                  ],
                ),
              ],
            ),
            Image.asset(
              'assets/vs.png',
              scale: 3,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      width: 100,
                      child: Text(fighterTwo.name,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.none)),
                    ),
                    LifeBar(fighterTwo, true, Colors.blue),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Image.asset(
                      fighterTwo.icon,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
