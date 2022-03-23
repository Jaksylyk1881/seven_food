import 'package:flutter/material.dart';
import 'package:seven_food/data/repository/login_services.dart';
import 'package:seven_food/presentation/screens/login/onboarding.dart';
import 'package:seven_food/presentation/screens/pin_code/login_by_pin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static String id = "/splash_screen";

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkIsLogin();
  }

  Future<void> checkIsLogin() async {

    String? _token = "";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString("token");
    if (_token != "" && _token != null) {
      if(!mounted){
      }
      if (await LoginService().getProfile(_token)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginByPinCode()),
        );
      }else{

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingPage()),
        );
      }
    } else {
      if(!mounted){
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
              height: 100, width: 100, child: Image.asset('images/logo.png'),),
        ),
      ),
    );
  }
}
