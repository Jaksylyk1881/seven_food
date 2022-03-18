import 'package:flutter/material.dart';
import 'package:seven_food/utils/colors.dart';
const kTextFieldDecoration = InputDecoration(

  hintStyle: TextStyle(color: Color(0xff8F98A8),fontFamily: "Manrope",fontSize: 18),
  contentPadding:
  EdgeInsets.symmetric(vertical: 20, horizontal: 25.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff041538)),
    borderRadius: BorderRadius.all(Radius.circular(56.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Color(0xff041538)),
    borderRadius: BorderRadius.all(Radius.circular(56.0)),
  ),
);

 const String baseUrl = "https://api.7food.kz/v1";
 const TextStyle textStyle = TextStyle(
   color: Color(0xff4F5C74),
 );

 const TextStyle textStyle1 = TextStyle(
   color: Color(0xff8F98A8),
   fontSize: 16,
    fontWeight: FontWeight.w600,
 );

const TextStyle textStyle2 = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontFamily: "ManropeBold",
  fontWeight: FontWeight.w600,
);

const TextStyle textStyle3 = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontFamily: "ManropeBold",
  fontWeight: FontWeight.w600,
);

const TextStyle textStyle5 = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontFamily: "ManropeBold",
  fontWeight: FontWeight.w600,
);
