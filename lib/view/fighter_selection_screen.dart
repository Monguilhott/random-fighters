import 'package:flutter/material.dart';
import 'package:street_fighter/model/scenarios_list.dart';
import '../controller/custom_button.dart';
import '../controller/fighters_area.dart';
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
  late Fighter fighterOne;
  late Fighter fighterTwo;

  @override
  void initState() {
    super.initState();
    fighterOne = widget.fighterOne;
    fighterTwo = widget.fighterTwo;
  }

  void _onFighterSelected(Fighter fighter){
    setState(() {
      fighterOne = fighter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/backgrounds/selection_screen_bg.png'),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'PLAYER SELECT',
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 25),
            ),
          ),
          Expanded(child: FighterSelectionBox(_onFighterSelected)),
          FightersArea(fighterOne, fighterTwo),
          CustomButton(fighterOne, fighterTwo,
              widget.selectedScenario),
        ],
      ),
    );
  }
}
