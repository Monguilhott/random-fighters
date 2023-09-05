import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:street_fighter/scenarios_list.dart';
import 'package:street_fighter/fighters_list.dart';
import 'fighters_area.dart';
import 'life_bar.dart';
import 'custom_button.dart';
import 'fight_log.dart';
import 'fighter.dart';

class StreetFighter extends StatefulWidget {
  const StreetFighter({super.key});

  @override
  State<StreetFighter> createState() => _FightersState();
}

class _FightersState extends State<StreetFighter> {
  List<TextSpan> _buildTextSpans(
      String data, Fighter fighterOne, Fighter fighterTwo) {
    List<TextSpan> textSpans = [];

    RegExp regex = RegExp(r'\S+');
    Iterable<Match> matches = regex.allMatches(data);

    List<String> words = [];
    for (Match match in matches) {
      words.add(match.group(0)!);
    }

    for (String part in words) {
      if (part == fighterOne.name) {
        textSpans.add(TextSpan(
          text: '$part ',
          style: const TextStyle(color: Colors.red),
        ));
      } else if (part == fighterTwo.name) {
        textSpans.add(
          TextSpan(
            text: '$part ',
            style: const TextStyle(color: Colors.blue),
          ),
        );
      } else if (part == fighterOne.life.toString() ||
          part == fighterTwo.life.toString()) {
        textSpans.add(
          TextSpan(
            text: '$part ',
            style: const TextStyle(color: Colors.green),
          ),
        );
      } else if (part == fighterOne.attack.toString() ||
          part == fighterTwo.attack.toString()) {
        textSpans.add(
          TextSpan(
            text: '$part ',
            style: const TextStyle(color: Colors.orange),
          ),
        );
      } else if (part == '3...' ||
          part == '2...' ||
          part == '1...' ||
          part == 'FIGHT!!!') {
        textSpans.add(
          TextSpan(
            text: '$part ',
            style: const TextStyle(color: Colors.yellow),
          ),
        );
      } else if (part == '&') {
        textSpans.add(
          const TextSpan(text: '\n'),
        );
      } else {
        textSpans.add(
          TextSpan(text: '$part '),
        );
      }
    }
    return textSpans;
  }

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
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 16),
                  child: Container(
                    height: 200,
                    width: 450,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(fontSize: 18),
                            children: _buildTextSpans(
                                snapshot.data?.join() ?? '',
                                fighterOne,
                                fighterTwo),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    //color: Colors.blue.withOpacity(0.5),
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
                ),
                FightersArea(fighterOne, fighterTwo),
                const CustomButton(),
              ],
            ),
          );
        });
  }
}
