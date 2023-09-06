import 'package:flutter/material.dart';

class FighterSelectionBox extends StatelessWidget {
  const FighterSelectionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          print('Geese selecionado');
        },
        child: SizedBox(
          height: 60,
          width: 60,
          child: Image.asset('assets/icons/select_screen/geese_ss.png', fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
