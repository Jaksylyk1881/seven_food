import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/cubit/auth/code_verification_cubit/verification_state.dart';
import 'package:seven_food/data/cubit/auth/login_cubit/login_state.dart';
import 'package:seven_food/data/cubit/auth/password_recovery_cubit/password_recovery_state.dart';
import 'package:seven_food/data/cubit/auth/registration_cubit/registration_cubit.dart';
import 'package:seven_food/data/cubit/fridge_cubit/fridge_cubit.dart';
import 'package:seven_food/data/cubit/history_cubit/history_cubit.dart';
import 'package:seven_food/data/cubit/products_cubit/products_cubit.dart';
import 'package:seven_food/data/cubit/profile_cubit/add_card_cubit.dart';
import 'package:seven_food/data/cubit/profile_cubit/profile_cubit.dart';
import 'package:seven_food/data/cubit/qr_cubit/qr_cubit.dart';
import 'package:seven_food/data/cubit/show_cases_cubit/showcases_cubit.dart';
import 'package:seven_food/presentation/screens/login/login_screen.dart';
import 'package:seven_food/presentation/screens/login/onboarding.dart';
import 'package:seven_food/presentation/screens/login/password_confirmation_screen.dart';
import 'package:seven_food/presentation/screens/login/password_recovery_screen.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/qr_item/qr_camera_page.dart';
import 'package:seven_food/presentation/screens/main/main_list.dart';
import 'package:seven_food/presentation/screens/main/splash_page.dart';
import 'package:seven_food/presentation/screens/pin_code/pin_code_screen.dart';
import 'package:seven_food/presentation/screens/registration/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp( const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<PasswordRecoveryCubit>(create: (context) => PasswordRecoveryCubit()),
        BlocProvider<VerificationCubit>(create: (context) => VerificationCubit()),
        BlocProvider<RegCubit>(create: (context) => RegCubit()),
        BlocProvider<ShowcasesCubit>(create: (context) => ShowcasesCubit()),
        BlocProvider<ProductsCubit>(create: (context) => ProductsCubit()),
        BlocProvider<HistoryCubit>(create: (context) => HistoryCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
        BlocProvider<AddCardCubit>(create: (context) => AddCardCubit()),
        BlocProvider<QrCubit>(create: (context) => QrCubit()),
        BlocProvider<FridgeCubit>(create: (context) => FridgeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontFamily: "ManropeBold",
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
            fontFamily: 'Manrope',
        ),
          initialRoute: SplashPage.id,
          routes: {
            LoginScreen.id: (context) =>  const LoginScreen(),
            RegistrationScreen.id: (context) => const RegistrationScreen(),
            OnBoardingPage.id:(context) => const OnBoardingPage(),
            PasswordRecovery.id:(context)=> const PasswordRecovery(),
            PasswordConfirmation.id:(context)=> const PasswordConfirmation(),
            PinCode.id:(context)=> const PinCode(),
            MainBottomList.id:(context)=> const MainBottomList(),
            SplashPage.id:(context)=> const SplashPage(),
            QrCameraPage.id:(context)=> const QrCameraPage()
          },
      ),
    );
  }
}
