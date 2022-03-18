import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seven_food/data/cubit/auth/password_recovery_cubit/password_recovery_state.dart';
import 'package:seven_food/presentation/screens/login/password_confirmation_screen.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/presentation/widgets/text_field_number.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordRecovery extends StatefulWidget {
  static const String id = '/password_recovery_screen';

  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  MaskTextInputFormatter maskTextInputFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##',
  );
  final controller = TextEditingController();
  bool isButtonActive = false;

  late SharedPreferences sharedPreferences;

  Future<void> setShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setBool("isRegistration", false);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(child: CircularProgressIndicator()),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: BlocConsumer<PasswordRecoveryCubit, PasswordRecoveryState>(
            listener: (context, state) {
              if (state is PasswordRecoveryLoading) {
                setState(() {
                  context.loaderOverlay.show();
                });
              }
              if (state is PasswordRecoveryError) {
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
              if (state is PasswordRecoverySuccess) {
                setState(() {
                  context.loaderOverlay.hide();
                });
                WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                  setShared();
                  Navigator.pushNamed(context, PasswordConfirmation.id);
                  //BlocProvider.of<PasswordRecoveryCubit>(context).initialState();
                });
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
                        title: 'Воостановить пароль',
                        subtitle: 'Введите номер телефона для воостановления',),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5,),
                        child: TextFieldNumber(
                          inputFormatters: [maskTextInputFormatter],
                          controller: controller,
                          callBack: (value) {
                            isButtonActive = controller.text.length == 15;
                            setState(() {

                            });
                          },
                        ),),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BlueButton(
                        color: blueForButton,
                          callback: isButtonActive
                              ? () {
                                  BlocProvider.of<PasswordRecoveryCubit>(
                                          context,)
                                      .sendResponseToCode("+7 ${controller.text}");
                                }
                              : null,
                          title: "ВОССТОНАВИТЬ",),
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
