import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';
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
  String? _phoneNumber;
  final controller = MaskedTextController(
    mask: '(000) 000-00-00',
  );
  bool isButtonActive = false;


  late SharedPreferences sharedPreferences;

  void setShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setBool("isRegistration", false);
    });
  }


  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final isButtonActive = (controller.text.length==15)&&controller.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PasswordRecoveryCubit,PasswordRecoveryState>(
        listener: (context,state){
          if(state is PasswordRecoveryError){
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
          if(state is PasswordRecoverySuccess){
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              setShared();
              Navigator.pushNamed(context, PasswordConfirmation.id);
              //BlocProvider.of<PasswordRecoveryCubit>(context).initialState();
            });
          }
        },
        builder: (context,state){
          if(state is PasswordRecoveryError){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          else if(state is PasswordRecoveryLoading){
            return const Center(
            child: CircularProgressIndicator(),
          );
          }

          return buildSafeArea(context);
        },
      ),
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
              const HeaderWidget(title: 'Воостановить пароль', subtitle: 'Введите номер телефона для воостановления'),
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
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlueButton(callback: (isButtonActive)?(){
                  controller.clear();
                  BlocProvider.of<PasswordRecoveryCubit>(context).sendResponseToCode("+7 $_phoneNumber");
                }:null, title: "ВОССТОНАВИТЬ"),
              ),
              const SizedBox(height: 25)
            ],
          ),
        ],
      ),
    );
  }
}
