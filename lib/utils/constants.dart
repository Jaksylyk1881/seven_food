import 'package:flutter/material.dart';
const kTextFieldDecoration = InputDecoration(

  hintStyle: TextStyle(color: Color(0xff8F98A8),fontFamily: "Manrope",fontSize: 18),
  contentPadding:
  EdgeInsets.symmetric(vertical: 20, horizontal: 25.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff041538), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(56.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Color(0xff041538), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(56.0)),
  ),
);
