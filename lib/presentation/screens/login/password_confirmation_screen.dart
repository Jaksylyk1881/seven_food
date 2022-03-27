import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';
import 'package:seven_food/data/cubit/auth/code_verification_cubit/verification_state.dart';
import 'package:seven_food/data/repository/login_services.dart';
import 'package:seven_food/presentation/screens/pin_code/pin_code_screen.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> getShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = sharedPreferences.getString('phone')!;
      isRegistration = sharedPreferences.getBool("isRegistration");
    });
  }
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: "ManropeBold",),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0x12041538)),
      borderRadius: BorderRadius.circular(40),
    ),
  );
  late String? _confirmationCode;
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
        final bool isActiveButton =
            controller.text.isNotEmpty && (controller.text.length >= 4);
        this.isActiveButton = isActiveButton;
      });
    });
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void startTimer() {
    _counter = 20;
    if(!mounted) return;
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
    return LoaderOverlay(
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: BlocConsumer<VerificationCubit, VerificationState>(
            listener: (BuildContext context, state) {
              if (state is VerificationError) {
                setState(() {
                  context.loaderOverlay.hide();
                });
                isError = true;
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Error'),
                    content: Text(state.message),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
              if (state is VerificationLoading) {
                setState(() {
                  context.loaderOverlay.show();
                });
              }
              if (state is VerificationLogged) {
                setState(() {
                  context.loaderOverlay.hide();
                });
                Navigator.pushNamed(context, PinCode.id);
              }
            },
            builder: (BuildContext context, Object? state) {
              return buildSafeArea(context);
            },
          ),
        ),
      ),
    );
  }

  SafeArea buildSafeArea(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    HeaderWidget(
                        title: 'Потверждение',
                        subtitle:
                            'Введите СМС-код, отправленный на номер чтобы $phoneNumber',),
                    Pinput(

                      controller: controller,
                      defaultPinTheme: defaultPinTheme,
                      onCompleted: (output){
                        _confirmationCode = output;
                        log(output);
                      },
                    ),
                    // PinCodeFields(
                    //   controller: controller,
                    //   fieldBorderStyle: FieldBorderStyle.Square,
                    //   responsive: false,
                    //   fieldHeight: 56.0,
                    //   fieldWidth: 56.0,
                    //   borderWidth: 1.0,
                    //   borderRadius: BorderRadius.circular(28),
                    //   keyboardType: TextInputType.number,
                    //   autoHideKeyboard: false,
                    //   borderColor: Colors.black38,
                    //   textStyle: const TextStyle(
                    //     fontSize: 36.0,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    //   onComplete: (output) {
                    //     // Your logic with pin code
                    //     _confirmationCode = output;
                    //     log(output);
                    //   },
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isError
                          ? const Text(
                              "Неверный код",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Manrope',
                                  color: Colors.red,),
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
                                      color: grey,),
                                ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (_counter == 0||isError)
                          ? TextButton(
                              onPressed: () {
                                startTimer();
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
                        callback: isActiveButton
                              ? () {
                                  controller.clear();
                                  (isRegistration!)
                                      ? BlocProvider.of<VerificationCubit>(
                                              context,)
                                          .registerCode(_confirmationCode!)
                                      : BlocProvider.of<VerificationCubit>(
                                              context,)
                                          .loginByCode(_confirmationCode!);
                                }
                              : null,
                          title: "ОТПРАВИТЬ",),
                    ),
                    const SizedBox(height: 25)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
