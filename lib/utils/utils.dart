
import 'package:flutter/material.dart';
import 'package:seven_food/presentation/screens/login/login_screen.dart';

Future<String?> buildShowError(BuildContext context, String message) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if(message=="Exception: Неаутентифицированный."){
              Navigator.pushReplacementNamed(context, LoginScreen.id);
            }else{
              Navigator.pop(context);
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}