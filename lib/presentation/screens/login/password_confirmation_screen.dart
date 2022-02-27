import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:seven_food/data/cubit/auth/code_verification_cubit/verification_state.dart';
import 'package:seven_food/data/repository/login_services.dart';
import 'package:seven_food/presentation/screens/pin_code/pin_code_screen.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO Make timer
class PasswordConfirmation extends StatefulWidget {
  static String id = "/password_confirmation_screen";

  const PasswordConfirmation({Key? key}) : super(key: key);

  @override
  _PasswordConfirmationState createState() => _PasswordConfirmationState();
}

class _PasswordConfirmationState extends State<PasswordConfirmation> {
  String phoneNumber = '';
  bool? isRegistration;
  late SharedPreferences sharedPreferences;

  void getShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = sharedPreferences.getString('phone')!;
      isRegistration = sharedPreferences.getBool("isRegistration");
    });
  }

  String? _confirmationCode;
  late int _counter = 0;
  Timer? timer;
  int levelClock = 180;
  TextEditingController controller = TextEditingController();
  bool isActiveButton = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    getShared();
    controller.addListener(() {
      setState(() {
        bool isActiveButton =
            controller.text.isNotEmpty && (controller.text.length >= 4);
        this.isActiveButton = isActiveButton;
      });
    });
    //startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void startTimer() {
    _counter = 20;
    if (mounted) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            timer.cancel();
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<VerificationCubit, VerificationState>(
        listener: (BuildContext context, state) {
          if (state is VerificationError) {
            isError = true;
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.message),
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
        },
        builder: (BuildContext context, Object? state) {
          if (state is VerificationInitial) {
            buildSafeArea(context);
          } else if (state is VerificationLoading) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
            });
          } else if (state is VerificationLogged) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pushNamed(context, PinCode.id);
              BlocProvider.of<VerificationCubit>(context).initialState();
            });
          }
          return buildSafeArea(context);
        },
      ),
    );
  }

  SafeArea buildSafeArea(context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
               HeaderWidget(title: 'Потверждение', subtitle: 'Введите СМС-код, отправленный на номер чтобы $phoneNumber'),
              PinCodeFields(
                controller: controller,
                length: 4,
                fieldBorderStyle: FieldBorderStyle.Square,
                responsive: false,
                fieldHeight: 56.0,
                fieldWidth: 56.0,
                borderWidth: 1.0,
                borderRadius: BorderRadius.circular(28),
                keyboardType: TextInputType.number,
                autoHideKeyboard: false,
                borderColor: Colors.black38,
                textStyle: const TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w900,
                ),
                onComplete: (output) {
                  // Your logic with pin code
                  _confirmationCode = output;
                  log(output);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (isError)
                    ? const Text(
                        "Неверный код",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope',
                            color: Colors.red),
                      )
                    : (_counter == 0)
                        ? const Text("")
                        : Text(
                            'Вы можете отправить код повторно через:  ${(_counter ~/ 60).toString().padLeft(2, '0')}:${(_counter % 60).toInt().toString().padLeft(2, '0')}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Manrope',
                                color: grey),
                          ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (_counter == 0)
                    ? TextButton(
                        onPressed: () {
                          //startTimer();
                          isError = false;
                          LoginService().loginByCode(phoneNumber);
                        },
                        child: const Text(
                          "ОТПРАВИТЬ КОД ПОВТОРНО",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : const Text(""),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlueButton(
                    callback: (isActiveButton)
                        ? () {
                            controller.clear();
                            (isRegistration!)
                                ? BlocProvider.of<VerificationCubit>(context)
                                    .registerCode(_confirmationCode!)
                                : BlocProvider.of<VerificationCubit>(context)
                                    .loginByCode(_confirmationCode!);
                          }
                        : null,
                    title: "ОТПРАВИТЬ"),
              ),
              const SizedBox(height: 25)
            ],
          ),
        ],
      ),
    );
  }
}
