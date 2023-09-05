import 'package:flutter/material.dart';
import 'package:street_fighter/scenarios_list.dart';
import 'fight_text_area.dart';
import 'fighters_area.dart';
import 'custom_button.dart';
import 'fight_log.dart';
import 'fighter.dart';
import 'life_bar_area.dart';

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
              children: [
                FightTextArea(fighterOne, fighterTwo, snapshot.data?.join() ?? ''),
                LifeBarArea(fighterOne, fighterTwo),
                FightersArea(fighterOne, fighterTwo),
                const CustomButton(),
              ],
            ),
          );
        });
  }
}
