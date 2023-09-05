import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:street_fighter/scenarios_list.dart';
import 'fight_log.dart';
import 'fight_screen.dart';
import 'fighter.dart';
import 'fighters_list.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    int randomFighter = Random().nextInt(fighters.length);
    int randomScenario = Random().nextInt(scenarios.length);

    Scenarios selectedScenario = scenarios[randomScenario];
    final player = AudioPlayer();
    player.play(AssetSource(selectedScenario.music));

    Fighter fighterOne = fighters[randomFighter];
    Fighter fighterTwo;
    int randomFightTwo = randomFighter;
    while (randomFightTwo == randomFighter) {
      randomFightTwo = Random().nextInt(fighters.length);
    }
    fighterTwo = fighters[randomFightTwo];

    fightLog(fighterOne, fighterTwo);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'Street Fighter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreetFighter(fighterOne, fighterTwo, selectedScenario),
    );
  }
}
