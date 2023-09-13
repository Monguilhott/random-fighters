import 'package:flutter/material.dart';
import '../model/fighter.dart';
import '../model/fighters_list.dart';

typedef OnFighterSelectedOne = void Function(Fighter fighter);
typedef OnFighterSelectedTwo = void Function(Fighter fighter);

class FighterSelectionBox extends StatefulWidget {
  final OnFighterSelectedOne onFighterSelectedOne;
  final OnFighterSelectedTwo onFighterSelectedTwo;

  const FighterSelectionBox(this.onFighterSelectedOne, this.onFighterSelectedTwo, {super.key});

  @override
  State<FighterSelectionBox> createState() => _FighterSelectionBoxState();
}

class _FighterSelectionBoxState extends State<FighterSelectionBox> {
  bool charOneSelected = false;
  bool charTwoSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GridView.builder(
        itemCount: fighters.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
        itemBuilder: (ctx, index) {
          var fighterInfo = fighters[index];
          var fighterInfoTwo = fighters[index];
          return GestureDetector(
            onTap: () {
              if (!charOneSelected) {
                charOneSelected = true;
                widget.onFighterSelectedOne(fighterInfo);
                fighterInfo.bordaAtiva = true;
              } else if (charOneSelected && !charTwoSelected) {
                charTwoSelected = true;
                widget.onFighterSelectedTwo(fighterInfoTwo);
                fighterInfoTwo.bordaAtiva = true;
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
                      color: fighterInfo.bordaAtiva
                          ? Colors.red
                          : Colors.transparent),
                  image: DecorationImage(
                    image: AssetImage(fighterInfo.iconSelectScreen),
                    fit: BoxFit.fitWidth,
                    colorFilter: fighterInfo.bordaAtiva
                        ? const ColorFilter.mode(
                            Colors.red, BlendMode.modulate)
                        : const ColorFilter.mode(
                            Colors.transparent, BlendMode.color),
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
