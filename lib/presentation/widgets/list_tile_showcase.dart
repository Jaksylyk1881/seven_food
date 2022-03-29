import 'package:flutter/material.dart';
import 'package:seven_food/utils/colors.dart';

class ListTileShowcase extends StatelessWidget {
  final String? status;
  final ShapeBorder? shapeBorder;
  final Color? color;
  final String id;
  final String subtitle;
  final TextStyle titleStyle;
  const ListTileShowcase({
    Key? key,
    this.status,
    this.shapeBorder,
    required this.titleStyle,
    this.color,
    required this.id,
    required this.subtitle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: shapeBorder,
      contentPadding:
      const EdgeInsets.fromLTRB(12, 10, 12, 10),
      tileColor: color,
      title: Row(
        children: [
          Text(
            id,
            style: titleStyle,),
          const SizedBox(
            width: 8,
          ),
           Container(
            decoration: BoxDecoration(
              color: secondaryBlue,
              borderRadius: const BorderRadius.all(
                Radius.circular(24),),
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 4,),
              child: Text(
                status!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,),
              ),
            ),
          )
        ],
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: lightGrey,),
      ),
      trailing: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/onboarding1.jpg"),
          ),
          borderRadius:
          BorderRadius.all(Radius.circular(4)),
        ),
        height: double.infinity,
        width: 48,
        child: const Text(""),
      ),
    );
  }
}
