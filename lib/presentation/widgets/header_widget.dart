import 'package:flutter/material.dart';
import 'package:seven_food/utils/colors.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const HeaderWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ManropeBold',),
              ),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
          child: Center(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Manrope',
                    color: grey,),
              ),),
        ),
      ],
    );
  }
}
