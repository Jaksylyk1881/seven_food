import 'package:flutter/material.dart';
import 'package:seven_food/utils/colors.dart';

class BlueButton extends StatelessWidget {
  final void Function()? callback;
  final String title;
  final Color? color;
  final Color? disabledColor;
  const BlueButton({Key? key,required this.callback,required this.title,this.color=blueForButton,this.disabledColor = blueForButtonDisabled}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: disabledColor ,
      color: color,
      elevation: 5,
      minWidth: MediaQuery.of(context).size.width,
      height: 56,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      onPressed: callback,
      child:  Text(title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 1),),);
  }
}
