import 'package:flutter/material.dart';
import 'package:seven_food/utils/colors.dart';

class LetterB extends StatelessWidget {
  const LetterB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: secondaryBlue,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Center(
          child: Text(
            "Б",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "ManropeBold",
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
