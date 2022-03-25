import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:seven_food/data/cubit/profile_cubit/profile_cubit.dart';
import 'package:seven_food/data/models/card/card.dart';
import 'package:seven_food/data/repository/login_services.dart';
import 'package:seven_food/presentation/custom_icons/bottom_nav_icons.dart';
import 'package:seven_food/presentation/screens/login/login_screen.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/profile_item/card_add_page.dart';
import 'package:seven_food/presentation/widgets/letter_b.dart';
import 'package:seven_food/presentation/widgets/master_card_logo_for_card.dart';
import 'package:seven_food/presentation/widgets/visa_logo_for_card.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:seven_food/utils/constants.dart';
import 'package:seven_food/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  String name = "";
  String phoneNum = "";
  String token = "";
  late AnimationController animationController;

  Future<void> getNameAndNum() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      token = sharedPreferences.getString("token")!;
      log(token);
      phoneNum = sharedPreferences.getString("phone")!;
      name = sharedPreferences.getString("name")!;
    });
  }

  @override
  void initState() {
    super.initState();
    getNameAndNum();
    animationController = BottomSheet.createAnimationController(this);
    animationController.duration = const Duration(milliseconds: 300);
    animationController.reverseDuration = const Duration(milliseconds: 300);
    BlocProvider.of<ProfileCubit>(context).getCards();
  }

  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (BuildContext context, state) {
          if (state is ProfileStateError) {
            buildShowError(context, state.message);
          }
        },
        builder: (BuildContext context, Object? state) {
          if (state is ProfileStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProfileStateLoaded) {
            return buildScaffold(context, state.cards, state.bonus);
          }
          return const Center(
            child: Text('Что то пошло не так!'),
          );
        },
      ),
    );
  }

  Scaffold buildScaffold(
    BuildContext context,
    List<Cardd> cards,
    String bonus,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 70,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                phoneNum,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    content: const Text("Вы уверены что хотите выйти?",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Manrope",),
                        textAlign: TextAlign.center,),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text(
                          "Выйти",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        onPressed: () {
                          LoginService().logOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                      CupertinoDialogAction(
                        child: const Text(
                          "Отмена",
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Container()
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.login),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              tileColor: contentBackground,
              leading: const LetterB(),
              title: const Text(
                "Бонусы",
                style: TextStyle(
                  fontFamily: "ManropeBold",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bonus,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "ManropeBold",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              tileColor: contentBackground,
              leading: const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                "Способ оплаты",
                style: TextStyle(
                  fontFamily: "ManropeBold",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              trailing: (cards.isEmpty)
                  ? IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CardAdd(),
                          ),
                        );
                      },
                    )
                  : TextButton(
                      onPressed: () {
                        showBottomSheetForCard(cards);
                      },
                      child: Text(
                        cards[0].maskedPan!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "ManropeBold",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
            ),
            const SizedBox(
              height: 1,
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              tileColor: contentBackground,
              leading: const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                "Уведомления",
                style: TextStyle(
                  fontFamily: "ManropeBold",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              trailing: CupertinoSwitch(
                activeColor: secondaryBlue,
                value: switchValue,
                onChanged: (newValue) {
                  switchValue = newValue;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              tileColor: contentBackground,
              leading: const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Icon(
                  BottomNavIcons.document,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                "Документы",
                style: TextStyle(
                  fontFamily: "ManropeBold",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Container(
                            color: const Color(0xff757575),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 10,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 120,
                                      ),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0x12041538),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(100),
                                          ),
                                        ),
                                        height: 5,
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 24),
                                        child: Text(
                                          'ДОКУМЕНТЫ',
                                          style: textStyle1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),
                                        color: contentBackground,
                                      ),
                                      child: ListTile(
                                        onTap: () async {
                                          const url =
                                              "https://docs.google.com/document/u/0/d/1s0HNlrNoseqZwbj89zvyl4zGihshZwJR0lc0TiosyEE/mobilebasic";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            // can't launch url
                                          }
                                        },
                                        tileColor: contentBackground,
                                        leading: const Icon(
                                          BottomNavIcons.document,
                                          color: Colors.black,
                                        ),
                                        title: const Text(
                                          'Публичная оферта',
                                          style: textStyle2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color: contentBackground,
                                      ),
                                      child: ListTile(
                                        onTap: () async {
                                          const url =
                                              "https://docs.google.com/document/u/0/d/1IsA5fyCKmAZCs7uggYYXUFGNvfZT9iA8_0Kboe5itdk/mobilebasic";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            // can't launch url
                                          }
                                        },
                                        tileColor: contentBackground,
                                        leading: const Icon(
                                          BottomNavIcons.document,
                                          color: Colors.black,
                                        ),
                                        title: const Text(
                                          'Условия использования',
                                          style: textStyle2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheetForCard(List<Cardd> cards) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              color: const Color(0xff757575),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0x12041538),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          height: 5,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Text(
                            'СПОСОБ ОПЛАТЫ',
                            style: textStyle1,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: index == 0
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      )
                                    : null,
                                color: contentBackground,
                              ),
                              child: ListTile(
                                tileColor: contentBackground,
                                leading: (cards[index].type=="Visa")?
                                  const VisaLogoForCard():const MasterCardLogoForCard()
                            ,
                                title: Text(
                                  cards[index].maskedPan!,
                                  style: textStyle2,
                                ),
                                trailing: TextButton(
                                  onPressed: () {
                                    showCupertinoDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return CupertinoAlertDialog(
                                          content:  Text("Вы уверены что хотите удалить карту “${cards[index].maskedPan?.substring(3)}”?",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "ManropeBold",),
                                            textAlign: TextAlign.center,),
                                          actions: [
                                            CupertinoDialogAction(
                                              child: const Text(
                                                "Удалить",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: Colors.black,),
                                              ),
                                              onPressed: () {
                                                BlocProvider.of<ProfileCubit>(
                                                  context,
                                                ).deleteCard(cards[index].id!);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                            ),
                                            CupertinoDialogAction(
                                              child: const Text(
                                                "Отмена",
                                                style: TextStyle(color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            Container()
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Удалить",
                                    style: TextStyle(
                                      color: grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: contentBackground,
                        ),
                        child: ListTile(
                          tileColor: contentBackground,
                          leading: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CardAdd(),
                                ),
                              );
                            },
                          ),
                          title: const Text(
                            'Добавить карту',
                            style: textStyle2,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
