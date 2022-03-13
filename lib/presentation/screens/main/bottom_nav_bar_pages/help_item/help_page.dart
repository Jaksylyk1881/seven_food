import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seven_food/presentation/custom_icons/bottom_nav_icons.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  Future<void> openTelegram() async {
    const String url = "https://telegram.me/Yerbolatmamen";
    log("launchingUrl: $url");
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Future<void> openWhatsapp() async {
    log("clicked");
    const whatsapp = "77078063820";
    const whatsappUrlAndroid = "whatsapp://send?phone=$whatsapp";
    const whatappUrlIos = "https://wa.me/$whatsapp";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappUrlIos)) {
        await launch(whatappUrlIos, forceSafariVC: false);
      } else {
        log("Error");
      }
    } else {
      // android , web
      if (await canLaunch(whatsappUrlAndroid)) {
        await launch(whatsappUrlAndroid);
      } else {
        log("Error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            "Помощь",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "ManropeBold",
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 38),
        child: Column(
          children: [
            const Text(
              "Выберите, пожалуйста, наиболее удобное приложение для Вас и напишите сообщение!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: MaterialButton(
                disabledColor: blueForButtonDisabled,
                color: const Color(0xff0088CC),
                elevation: 5,
                height: 56,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                onPressed: () {
                  openTelegram();
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: const Icon(
                          BottomNavIcons.telegramPlane,
                          color: Color(0xff0088CC),
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Написать в Telegram",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
              disabledColor: blueForButtonDisabled,
              color: const Color(0xff25D366),
              elevation: 5,
              height: 56,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              onPressed: () {
                openWhatsapp();
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: const Icon(
                        BottomNavIcons.whatsapp,
                        color: Color(0xff25D366),
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Написать в Whatsapp",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
