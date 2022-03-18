import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seven_food/data/cubit/auth/login_cubit/login_state.dart';
import 'package:seven_food/presentation/screens/login/password_recovery_screen.dart';
import 'package:seven_food/presentation/screens/pin_code/pin_code_screen.dart';
import 'package:seven_food/presentation/screens/registration/registration_screen.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/presentation/widgets/text_field_number.dart';
import 'package:seven_food/presentation/widgets/text_field_password.dart';
import 'package:seven_food/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isButtonActive = false;
  bool isButtonActive2 = false;
  MaskTextInputFormatter maskTextInputFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##',
  );

  @override
  void initState() {
    super.initState();
    // controllerPassword.addListener(() {
    //   final isButtonActive2 = (controllerPassword.text.length>7)&&controllerPassword.text.isNotEmpty;
    //   setState(() {
    //     this.isButtonActive2 = isButtonActive2;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
            builder: (context, state) {
              return buildSafeArea(context);
            },
            listener: (context, state) {
              if (state is LoginLoading) {
                setState(() {
                  context.loaderOverlay.show();
                });
              }
              if (state is LoginError) {
                setState(() {
                  context.loaderOverlay.hide();
                });
                buildShowError(context, state.message);
              }
              if (state is LoginLogged) {
                setState(() {
                  context.loaderOverlay.hide();
                });
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, PinCode.id);
                });
              }
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
                    const HeaderWidget(
                      title: "Вход в 7Food",
                      subtitle: "Введите номер телефона и пароль",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: getTextFieldNumber(
                        inputFormatters: [maskTextInputFormatter],
                        controller: controller,
                        callBack: (value) {
                          isButtonActive = controller.text.length == 15;
                          setState(() {

                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: TextFieldPassword(
                        controller: controllerPassword,
                        callBack: (value) {
                          isButtonActive2 =
                              (controllerPassword.text.length > 7) &&
                                  controllerPassword.text.isNotEmpty;
                          setState(() {

                          });
                        },
                        hintText: "Пароль",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PasswordRecovery.id);
                        },
                        child: const Text(
                          "ЗАБЫЛИ ПАРОЛЬ?",
                          style: TextStyle(fontSize: 16, color: Colors.black),
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
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                        child: const Text(
                          "ЗАРЕГИСТРИРОВАТЬСЯ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BlueButton(
                        callback: (isButtonActive && isButtonActive2)
                            ? () {
                                log("+7 ${controller.text}");
                                BlocProvider.of<LoginCubit>(context)
                                    .loginByPhoneNumberAndPassword(
                                  "+7 ${controller.text}",
                                  controllerPassword.text,
                                );
                                // controller.clear();
                                // controllerPassword.clear();
                              }
                            : null,
                        title: "ВОЙТИ",
                      ),
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
