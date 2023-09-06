import 'package:flutter/material.dart';
import 'package:street_fighter/model/scenarios_list.dart';
import '../controller/custom_button_back.dart';
import '../controller/fight_text_area.dart';
import '../controller/fighters_area.dart';
import '../controller/fight_log.dart';
import '../model/fighter.dart';
import '../controller/life_bar_area.dart';

class StreetFighter extends StatelessWidget {
  const StreetFighter(this.fighterOne, this.fighterTwo, this.selectedScenario, {super.key});
  final Fighter fighterOne;
  final Fighter fighterTwo;
  final Scenarios selectedScenario;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
        stream: fightLog(fighterOne, fighterTwo),
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(selectedScenario.scenario),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomButtonBack(),
                FightTextArea(fighterOne, fighterTwo, snapshot.data?.join() ?? ''),
                LifeBarArea(fighterOne, fighterTwo),
                FightersArea(fighterOne, fighterTwo),
              ],
            ),
          );
        });
  }
}
