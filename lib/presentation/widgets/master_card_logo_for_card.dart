import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MasterCardLogoForCard extends StatelessWidget {
  const MasterCardLogoForCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xff0D70E3),
        borderRadius: BorderRadius.circular(40),
      ),
      child:  Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Center(child: SvgPicture.asset("icons/mastercard.svg",width: 30,)),
      ),
    );
  }
}
