import 'package:flutter/material.dart';

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
      width: 100,
      height: 15,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index){
              for(int i = 0; i<controller.text.length; i++){
                circles[i] = Colors.black;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 15,
                  width: 15,
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
