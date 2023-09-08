import 'package:flutter/material.dart';
import '../model/fighter.dart';
import '../model/fighters_list.dart';

typedef OnFighterSelected = void Function(Fighter fighter);

class FighterSelectionBox extends StatelessWidget {
  final OnFighterSelected onFighterSelected;
  const FighterSelectionBox(this.onFighterSelected, {super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GridView.builder(
        itemCount: fighters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
        itemBuilder: (ctx, index){
          var fighterInfo = fighters[index];
          return GestureDetector(
            onTap: () {
              onFighterSelected(fighterInfo);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(fighterInfo.iconSelectScreen,
                    fit: BoxFit.fitWidth),
              ),
            ),
          );
        },
      ),
    );
  }
}
