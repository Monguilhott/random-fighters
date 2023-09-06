import 'package:flutter/material.dart';
import 'package:street_fighter/model/fighter.dart';

class FightTextArea extends StatelessWidget {
  const FightTextArea(this.fighterOne, this.fighterTwo, this.fightLog, {super.key});

  final Fighter fighterOne;
  final Fighter fighterTwo;
  final String fightLog;

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
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                    fightLog,
                    fighterOne,
                    fighterTwo),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
