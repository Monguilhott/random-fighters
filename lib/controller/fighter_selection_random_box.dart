import 'package:flutter/material.dart';

class FighterSelectionRandomBox extends StatelessWidget {
  const FighterSelectionRandomBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: 60,
        width: 125,
        child: Image.asset('assets/icons/select_screen/random_ss.png', fit: BoxFit.fitWidth),
      ),
    );
  }
}
