// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seven_food/data/cubit/auth/registration_cubit/registration_cubit.dart';
import 'package:seven_food/presentation/screens/login/login_screen.dart';
import 'package:seven_food/presentation/screens/login/password_confirmation_screen.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/presentation/widgets/text_field_number.dart';
import 'package:seven_food/presentation/widgets/text_field_password.dart';
import 'package:seven_food/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/registration_screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 late String? _name;
  String? _phoneNumber;
  late String? _password;
  MaskTextInputFormatter maskTextInputFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##',
  );

  TextEditingController controllerName = TextEditingController();
  MaskedTextController controller = MaskedTextController(
    mask: '(000) 000-00-00',
  );
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPasswordConfirm = TextEditingController();
  bool isButtonActiveNumber = false;
  bool isButtonActivePassword = false;
  bool isButtonActiveConfirm = false;
  bool isButtonActiveName = false;

  late SharedPreferences sharedPreferences;

  Future<void> setShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setBool("isRegistration", true);
    });
  }

  @override
  void initState() {
    super.initState();
    controllerName.addListener(() {
      final isButtonActive =
          (controllerName.text.length > 1) && controllerName.text.isNotEmpty;
      setState(() {
        isButtonActiveName = isButtonActive;
      });
    });
    controllerPasswordConfirm.addListener(() {
      final isButtonActive =
          (controllerPasswordConfirm.text == controllerPassword.text) &&
              controllerPasswordConfirm.text.isNotEmpty;
      setState(() {
        isButtonActiveConfirm = isButtonActive;
      });
    });
    controller.addListener(() {
      final isButtonActive =
          (controller.text.length == 15) && controller.text.isNotEmpty;
      setState(() {
        isButtonActiveNumber = isButtonActive;
      });
    });
    controllerPassword.addListener(() {
      final isButtonActive = (controllerPassword.text.length > 7) &&
          controllerPassword.text.isNotEmpty;
      setState(() {
        isButtonActivePassword = isButtonActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: BlocConsumer<RegCubit, RegState>(
            listener: (context, state) {
              if (state is RegError) {
                setState(() {
                  context.loaderOverlay.hide();
                });
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
              if (state is RegLoading) {
                setState(() {
                  context.loaderOverlay.show();
                });
              }
              if (state is RegSuccess) {
                setState(() {
                  context.loaderOverlay.hide();
                });
                Navigator.pushNamed(context, PasswordConfirmation.id);
              }
            },
            builder: (context, state) {
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
                    const HeaderWidget(
                        title: "Регистрация в 7Food",
                        subtitle:
                            'Введите номер телефона, чтобы войти в приложение через СМС-код',),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5,),
                      child: TextField(
                        style: const TextStyle(
                            fontFamily: "ManropeBold", fontSize: 18,),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Ваше имя",
                        ),
                        controller: controllerName,
                        onChanged: (value) {
                          _name = value;
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5,),
                        child: TextFieldNumber(
                          controller: controller,
                          callBack: (value) {
                            _phoneNumber = value;
                          },
                        ),),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5,),
                        child: TextFieldPassword(
                          controller: controllerPassword,
                          callBack: (value) {
                            _password = value;
                          },
                          hintText: "Пароль",
                        ),),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5,),
                        child: TextFieldPassword(
                          controller: controllerPasswordConfirm,
                          callBack: (value) {
                            _password = value;
                          },
                          hintText: "Повторите пароль",
                        ),),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: const Text(
                          "У МЕНЯ УЖЕ ЕСТЬ АККАУНТ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BlueButton(
                        callback:
                        // (isButtonActiveName &&
                        //           isButtonActiveNumber &&
                        //           isButtonActivePassword &&
                        //           isButtonActiveConfirm)
                              //?
                        () {
                                  BlocProvider.of<RegCubit>(context)
                                      .registering(_name!, "+7 $_phoneNumber",
                                          _password!, _password!,);
                                  controllerName.clear();
                                  controller.clear();
                                  controllerPassword.clear();
                                  controllerPasswordConfirm.clear();
                                },
                             // : null,
                          title: "ЗАРЕГИСТРИТОВАТЬСЯ",),
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
