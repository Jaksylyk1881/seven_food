import 'package:flutter/material.dart';
import 'package:seven_food/presentation/screens/pin_code/pin_code_confirm_screen.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/presentation/widgets/indicator_pin_code.dart';
import 'package:seven_food/presentation/widgets/num_pad.dart';
import 'package:seven_food/utils/colors.dart';

class PinCode extends StatefulWidget {
  static const String id = "/pin_code";

  const PinCode({Key? key}) : super(key: key);

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  bool isActiveButton = false;

  @override
  void initState() {
    super.initState();
    _myController.clear();
    _myController.addListener(() {
      setState(() {
        final bool isActiveButton =
            _myController.text.isNotEmpty && (_myController.text.length >= 4);
        this.isActiveButton = isActiveButton;
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
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeaderWidget(
                    title: "Придумайте PIN",
                    subtitle: "Для быстрого входа в приложение",
                  ),
                  Indicator(
                    controller: _myController,
                  ),
                  NumPad(
                    showBioIcon: false,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25,),
                    child: BlueButton(
                      callback: isActiveButton
                            ? () {
                                WidgetsBinding.instance
                                    ?.addPostFrameCallback((_) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PinCodeConfirmation(
                                                  pin: _myController.text,),),);
                                });
                              }
                            : null,
                        title: "Далее",),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
