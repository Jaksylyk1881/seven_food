import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:seven_food/presentation/screens/main/main_list.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/presentation/widgets/num_pad.dart';

class PinCodeConfirmation extends StatefulWidget {
  final String pin;
  const PinCodeConfirmation({Key? key,required this.pin}) : super(key: key);

  @override
  _PinCodeConfirmationState createState() => _PinCodeConfirmationState();
}

class _PinCodeConfirmationState extends State<PinCodeConfirmation> {
  bool isActiveButton = false;
  int a = 1;


  @override
  void initState() {
    super.initState();
    log(widget.pin);
    _myController.addListener(() {
      setState(() {
        bool isActiveButton =
        (_myController.text == widget.pin)&&(_myController.text.length>=4);
        this.isActiveButton = isActiveButton;

        if((_myController.text == widget.pin)&&(_myController.text.length>=4)){
          a = 2;
        }else if((_myController.text != widget.pin)&&(_myController.text.length>=4)){
          a = 3;
        }
        if(a==2){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainList()));
        }else if(a==3){
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error'),
              content: const Text("Повторите еще раз"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 2);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }
  final TextEditingController _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
              children:  [
                const HeaderWidget(title: "Повторите PIN", subtitle: "Для быстрого входо в приложение"),
                NumPad(
                  buttonSize: 50,
                  buttonColor: Colors.white,
                  iconColor: Colors.black,
                  controller: _myController,
                  delete: () {
                    if(_myController.text.isEmpty) {

                    }else{
                      _myController.text = _myController.text
                          .substring(0, _myController.text.length - 1);
                    }
                  },
                  // do something with the input numbers
                  onSubmit: () {
                    debugPrint('Your code: ${_myController.text}');
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          content: Text(
                            "You code is ${_myController.text}",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ));
                  },
                ),
              ],
        ),
      ),
    );
  }
}
