import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:seven_food/utils/constants.dart';
class TextFieldNumber extends StatelessWidget {
  final void Function(String)? callBack;
  final MaskedTextController controller;
  const TextFieldNumber({Key? key,required this.controller,this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return TextField(
      style:
      const TextStyle(fontFamily: "ManropeBold", fontSize: 18),
      textAlignVertical: TextAlignVertical.center,
      decoration: kTextFieldDecoration.copyWith(
        hintText: "Номер телефона",
        prefixIcon: const Padding(
          padding: EdgeInsets.only(top: 14, left: 10),
          child: Text(
            "+7",
            style:
            TextStyle(fontSize: 18, fontFamily: "ManropeBold"),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: callBack,
    );
  }
}
