import 'package:flutter/material.dart';
import '../model/fighters_list.dart';

class FighterSelectionBox extends StatelessWidget {
  const FighterSelectionBox({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {

        },
        child: GridView.builder(
          itemCount: fighters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
          itemBuilder: (ctx, index){
            final fighterInfo = fighters[index];
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(fighterInfo.iconSelectScreen,
                    fit: BoxFit.fitWidth),
              ),
            );
          },
        ),
      ),
    );
  }
}
