import 'package:flutter/material.dart';
import 'package:seven_food/utils/colors.dart';

class Indicator extends StatelessWidget {
  final TextEditingController controller;
  const Indicator({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> circles = [
      Colors.grey,
      Colors.grey,
      Colors.grey,
      Colors.grey
    ];
    return SizedBox(
      width: 150,
      height: 15,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index){
              for(int i = 0; i<controller.text.length; i++){
                circles[i] = grey;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: circles[index],
                  ),
                ),
              );
            },),
      ),
    );
  }
}
