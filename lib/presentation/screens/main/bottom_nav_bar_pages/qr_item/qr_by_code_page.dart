import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';
import 'package:seven_food/data/cubit/qr_cubit/qr_cubit.dart';
import 'package:seven_food/presentation/screens/main/fridge_pages/fridge_page.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:seven_food/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrByCodePage extends StatefulWidget {
  const QrByCodePage({Key? key}) : super(key: key);

  @override
  _QrByCodePageState createState() => _QrByCodePageState();
}

class _QrByCodePageState extends State<QrByCodePage> {
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
  late int fridgeId;
  late int id;

  Future<void> getId() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    setState(() {
      id = sharedPreferences.getInt("id")!;
      log("$id");
    });
  }


  @override
  void initState() {
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Ввести код вручную",
            style: TextStyle(color: Colors.black, fontFamily: "ManropeBold"),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocConsumer<QrCubit,QrState>(
          listener: (BuildContext context, state) {
            if(state is QrStateLoading){
              setState(() {
                context.loaderOverlay.show();
              });
            }else if(state is QrStateLoaded){
              setState(() {
                context.loaderOverlay.hide();
              });
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FridgePage(fridgeId: fridgeId,id:id,orderID: state.orderID,)));
              });
            }else if(state is QrStateError){
              setState(() {
                context.loaderOverlay.hide();
              });
              buildShowError(context, state.message);
            }
          },
          builder: (BuildContext context, Object? state) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 40, 8, 24),
                        child: Center(
                          child: Text(
                            "Ввести код",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ManropeBold',
                            ),
                          ),
                        ),
                      ),
                      Pinput(
                        length: 5,
                        defaultPinTheme: defaultPinTheme,
                        onCompleted: (String value){
                          fridgeId = int.parse(value);
                          BlocProvider.of<QrCubit>(context).openFridge(int.parse(value));
                          setState(() {
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          'Введите код который находится у двери аппарата',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: grey,
                            fontWeight: FontWeight.w400,
                            fontFamily: "ManropeBold",),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },

        ),
      ),
    );
  }
}
