import 'package:flutter/material.dart';
import 'package:street_fighter/model/scenarios_list.dart';
import '../view/fight_screen.dart';
import '../model/fighter.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.fighterOne, this.fighterTwo, this.selectedScenario, {super.key});
  final Fighter fighterOne;
  final Fighter fighterTwo;
  final Scenarios selectedScenario;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 12, bottom: 12, right: 12, top: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StreetFighter(fighterOne, fighterTwo, selectedScenario)));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ]),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ]),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sports_mma,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    Text(
                      'FIGHT',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
