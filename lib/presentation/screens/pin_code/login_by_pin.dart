import 'package:flutter/material.dart';
import 'package:seven_food/data/local_auth_api.dart';
import 'package:seven_food/presentation/screens/login/login_screen.dart';
import 'package:seven_food/presentation/screens/main/main_list.dart';
import 'package:seven_food/presentation/widgets/header_widget.dart';
import 'package:seven_food/presentation/widgets/indicator_pin_code.dart';
import 'package:seven_food/presentation/widgets/num_pad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginByPinCode extends StatefulWidget {
  const LoginByPinCode({Key? key}) : super(key: key);

  @override
  _LoginByPinCodeState createState() => _LoginByPinCodeState();
}

class _LoginByPinCodeState extends State<LoginByPinCode> {
  
  final TextEditingController _myController = TextEditingController();
    String name="";
  late String pin;
  late bool useBiometrics = false;
  int a = 1;
  Future<void> getPinCode() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      pin = sharedPreferences.getString("pinCode")!;
      name = sharedPreferences.getString("name")!;
      useBiometrics = sharedPreferences.getBool("useBiometrics")!;
    });
  }
  bool isAvailableBiometrics=false;

  Future<void> hasBiometrics() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isAvailableBiometrics = await LocalAuthApi.hasBiometrics();
    sharedPreferences.setBool("isAvBio", isAvailableBiometrics);
    sharedPreferences.setBool("isFirstLog", false);
  }


  Future<void> biometricLogin() async{
    final isAuthenticated = await LocalAuthApi.authenticate();
    if (isAuthenticated) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainBottomList()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    hasBiometrics();
    getPinCode();
    _myController.addListener(() {
      setState(() {
        if ((_myController.text == pin) &&
            (_myController.text.length >= 4)) {
          a = 2;
        } else if ((_myController.text != pin) &&
            (_myController.text.length >= 4)) {
          a = 3;
        }
        if (a == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainBottomList()),);
        } else if (a == 3) {
          a = 1;
          _myController.clear();
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error'),
              content: const Text("Повторите еще раз"),
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
    if(useBiometrics){
      biometricLogin();
    }
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   HeaderWidget(
                      title: "Привет, $name",
                      subtitle: "Мы рады, что вы снова здесь",),
                  Indicator(controller: _myController),
                  NumPad(
                    onTap: (){
                      biometricLogin();
                    },
                    showBioIcon: isAvailableBiometrics&&useBiometrics,
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
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, LoginScreen.id);
                        }, child: const Text("Войти по другому номеру",style: TextStyle(
                          fontSize: 16,
                      ),),
                      ),
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
