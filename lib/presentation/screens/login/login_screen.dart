import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:seven_food/data/cubit/auth/login_cubit/login_state.dart';
import 'package:seven_food/presentation/screens/login/password_recovery_screen.dart';
import 'package:seven_food/presentation/screens/pin_code/pin_code_screen.dart';
import 'package:seven_food/presentation/screens/registration/registration_screen.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/presentation/widgets/text_field_number.dart';
import 'package:seven_food/presentation/widgets/text_field_password.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _phoneNumber;
  String? _password;
  final controller = MaskedTextController(
    mask: '(000) 000-00-00',
  );
  TextEditingController controllerPassword = TextEditingController();
  bool isButtonActive = false;
  bool isButtonActive2 = false;


  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final isButtonActive = (controller.text.length==15)&&controller.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    controllerPassword.addListener(() {
      final isButtonActive = (controllerPassword.text.length>7)&&controllerPassword.text.isNotEmpty;
      setState(() {
        isButtonActive2 = isButtonActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: BlocConsumer<LoginCubit,LoginState>
        (builder: (context,state){
          if(state is LoginInitial){
            return buildSafeArea(context);
          }
          if(state is LoginLoading){
            WidgetsBinding.instance?.addPostFrameCallback((_){
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
            });
          }
          if(state is LoginLogged){
            WidgetsBinding.instance?.addPostFrameCallback((_){
              Navigator.pushNamed(context, PinCode.id);
              BlocProvider.of<LoginCubit>(context).initial();
            });
          }
          return buildSafeArea(context);
      }, listener: (context,state){
          if(state is LoginError){
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Error'),
                content:  Text(state.message),
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
      }),
    );
  }

  SafeArea buildSafeArea(BuildContext context) {
    return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const HeaderWidget(title: "Вход в 7Food", subtitle: "Введите номер телефона и пароль"),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextFieldNumber(
                          controller: controller,
                          callBack: (value){
                            _phoneNumber = value;
                          },
                        )
                    ),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextFieldPassword(
                          controller: controllerPassword,
                          callBack: (value){
                            _password = value;
                          },
                          hintText: "Пароль",
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PasswordRecovery.id);
                        },
                        child: const Text(
                          "ЗАБЫЛИ ПАРОЛЬ?",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                        child: const Text(
                          "ЗАРЕГИСТРИРОВАТЬСЯ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BlueButton(callback: (isButtonActive&&isButtonActive2)?(){
                        log("+7 $_phoneNumber");
                        BlocProvider.of<LoginCubit>(context).loginByPhoneNumberAndPassword("+7 $_phoneNumber", _password!);
                        controller.clear();
                        controllerPassword.clear();
                      }:null, title: "ВОЙТИ"),
                    ),
                    const SizedBox(height: 25)
                  ],
                ),
              ],
            ),
          );
  }
}
