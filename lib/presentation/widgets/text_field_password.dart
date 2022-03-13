import 'package:flutter/material.dart';
import 'package:seven_food/utils/constants.dart';
class TextFieldPassword extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? callBack;
  const TextFieldPassword({Key? key,required this.controller,this.callBack,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 18),
      obscureText: true,
      textAlignVertical: TextAlignVertical.center,
      decoration: kTextFieldDecoration.copyWith(
        hintText: hintText,
      ),
      onChanged: callBack,
    );
  }
}
