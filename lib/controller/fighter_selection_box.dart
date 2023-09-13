import 'package:flutter/material.dart';
import '../model/fighter.dart';
import '../model/fighters_list.dart';

typedef OnFighterSelected = void Function(Fighter fighter);

class FighterSelectionBox extends StatefulWidget {
  final OnFighterSelected onFighterSelected;

  const FighterSelectionBox(this.onFighterSelected, {super.key});

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
          return GestureDetector(
            onTap: () {
              if (!charOneSelected) {
                charOneSelected = true;
                widget.onFighterSelected(fighterInfo);
                fighterInfo.bordaAtiva = true;
              }
              if (charOneSelected && !charTwoSelected) {
                charTwoSelected = true;
                widget.onFighterSelected(fighterInfo);
                fighterInfo.bordaAtiva = true;
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
