import 'dart:math';
import 'package:flutter/material.dart';
import 'package:street_fighter/model/scenarios_list.dart';
import '../controller/custom_button.dart';
import '../controller/fight_log.dart';
import '../model/fighter.dart';
import '../controller/fighter_selection_box.dart';

class FighterSelectionScreen extends StatefulWidget {
  const FighterSelectionScreen(
      this.fighterOne, this.fighterTwo, this.selectedScenario,
      {super.key});

  final Fighter fighterOne;
  final Fighter fighterTwo;
  final Scenarios selectedScenario;

  @override
  State<FighterSelectionScreen> createState() => _FighterSelectionScreenState();
}

class _FighterSelectionScreenState extends State<FighterSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
        stream: fightLog(widget.fighterOne, widget.fighterTwo),
        builder: (context, snapshot) {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/backgrounds/selection_screen_bg.png'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'PLAYER SELECT',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 25),
                  ),
                ),
                const Expanded(child: FighterSelectionBox()),
                SizedBox(
                  height: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        widget.fighterOne.image,
                        scale: 0.45,
                      ),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Image.asset(
                          widget.fighterTwo.image,
                          scale: 0.45,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(widget.fighterOne, widget.fighterTwo,
                    widget.selectedScenario),
              ],
            ),
          );
        });
  }
}
