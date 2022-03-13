import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:seven_food/data/repository/login_services.dart';
import 'package:seven_food/presentation/screens/main/main_list.dart';
import 'package:seven_food/presentation/screens/pin_code/pin_code_screen.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/presentation/widgets/indicator_pin_code.dart';
import 'package:seven_food/presentation/widgets/num_pad.dart';

class PinCodeConfirmation extends StatefulWidget {
  final String pin;

  const PinCodeConfirmation({Key? key, required this.pin}) : super(key: key);

  @override
  _PinCodeConfirmationState createState() => _PinCodeConfirmationState();
}

class _PinCodeConfirmationState extends State<PinCodeConfirmation> {
  bool isActiveButton = false;
  int a = 1;
  final TextEditingController _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    log(widget.pin);
    _myController.addListener(() {
      setState(() {
        final bool isActiveButton = (_myController.text == widget.pin) &&
            (_myController.text.length >= 4);
        this.isActiveButton = isActiveButton;

        if ((_myController.text == widget.pin) &&
            (_myController.text.length >= 4)) {
          a = 2;
        } else if ((_myController.text != widget.pin) &&
            (_myController.text.length >= 4)) {
          a = 3;
        }
        if (a == 2) {
          LoginService().setPinCode(widget.pin);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainBottomList()),);
        } else if (a == 3) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error'),
              content: const Text("Повторите еще раз"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PinCode.id);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeaderWidget(
                      title: "Повторите PIN",
                      subtitle: "Для быстрого входо в приложение",),
                  Indicator(controller: _myController),
                  NumPad(
                    buttonSize: 90,
                    buttonColor: Colors.white,
                    iconColor: Colors.black,
                    controller: _myController,
                    delete: () {
                      if (_myController.text.isEmpty) {
                      } else {
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
                              ),);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25,),
                    child: SizedBox(height: 56,),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
