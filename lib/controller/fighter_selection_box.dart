import 'dart:math';
import 'package:flutter/material.dart';
import '../model/fighter.dart';
import '../model/fighters_list.dart';

typedef OnFighterSelectedOne = void Function(Fighter fighter);
typedef OnFighterSelectedTwo = void Function(Fighter fighter);

class FighterSelectionBox extends StatefulWidget {
  final OnFighterSelectedOne onFighterSelectedOne;
  final OnFighterSelectedTwo onFighterSelectedTwo;

  const FighterSelectionBox(
      this.onFighterSelectedOne, this.onFighterSelectedTwo,
      {super.key});

  @override
  State<FighterSelectionBox> createState() => _FighterSelectionBoxState();
}

class _FighterSelectionBoxState extends State<FighterSelectionBox> {
  Fighter? fighterOne;
  Fighter? fighterTwo;

  Color _getBorderColor(Fighter fighter){
    if(fighter.name == fighterOne?.name){
      return Colors.red;
    }
    if(fighter.name == fighterTwo?.name){
      return Colors.blue;
    }
    return Colors.transparent;
  }

  ColorFilter _getColorFilter(Fighter fighter){
    if(fighter.name == fighterOne?.name){
      return const ColorFilter.mode(Colors.red, BlendMode.modulate);
    }
    if(fighter.name == fighterTwo?.name){
      return const ColorFilter.mode(Colors.blue, BlendMode.modulate);
    }
    return const ColorFilter.mode(Colors.transparent, BlendMode.color);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: fighters.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
        itemBuilder: (ctx, index) {
          var fighterInfo = fighters[index];
          return GestureDetector(
            onTap: () {
              if (index == fighters.length - 1){
                var randomIndex = Random().nextInt(fighters.length - 2);
                fighterInfo = fighters[randomIndex];
              }
              if (fighterOne == null) {
                widget.onFighterSelectedOne(fighterInfo);
                setState(() {
                  fighterOne = fighterInfo;
                });
              } else if (fighterOne != null && fighterTwo == null) {
                widget.onFighterSelectedTwo(fighterInfo);
                setState(() {
                  fighterTwo = fighterInfo;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3.0,
                      color: _getBorderColor(fighterInfo)),
                  image: DecorationImage(
                    image: AssetImage(fighterInfo.iconSelectScreen),
                    fit: BoxFit.fitWidth,
                    colorFilter: _getColorFilter(fighterInfo),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}