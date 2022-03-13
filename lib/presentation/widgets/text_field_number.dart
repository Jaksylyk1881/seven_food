import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:seven_food/utils/constants.dart';

class TextFieldNumber extends StatelessWidget {
  final void Function(String)? callBack;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldNumber(
      {Key? key,required this.controller,this.callBack,this.inputFormatters,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontFamily: "ManropeBold", fontSize: 18),
      textAlignVertical: TextAlignVertical.center,
      decoration: kTextFieldDecoration.copyWith(
        hintText: "Номер телефона",
        prefixIcon: const Padding(
          padding: EdgeInsets.only(top: 14, left: 10),
          child: Text(
            "+7",
            style: TextStyle(fontSize: 18, fontFamily: "ManropeBold"),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      // inputFormatters: [
      //   MaskTextInputFormatter(
      //       mask: '(###) ###-##-##', filter: {"#": RegExp(r'[0-9]')})
      // ],
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: callBack,
    );
  }

}

TextField getTextFieldNumber({
  required TextEditingController controller,
  required Function(String)? callBack,
  List<TextInputFormatter>? inputFormatters,
}) {
  return TextField(
    style: const TextStyle(fontFamily: "ManropeBold", fontSize: 18),
    textAlignVertical: TextAlignVertical.center,
    decoration: kTextFieldDecoration.copyWith(
      hintText: "Номер телефона",
      prefixIcon: const Padding(
        padding: EdgeInsets.only(top: 14, left: 10),
        child: Text(
          "+7",
          style: TextStyle(fontSize: 18, fontFamily: "ManropeBold"),
          textAlign: TextAlign.center,
        ),
      ),
    ),
// inputFormatters: [
//   MaskTextInputFormatter(
//       mask: '(###) ###-##-##', filter: {"#": RegExp(r'[0-9]')})
// ],
    inputFormatters: inputFormatters,
    keyboardType: TextInputType.number,
    controller: controller,
    onChanged: callBack,
  );
}
