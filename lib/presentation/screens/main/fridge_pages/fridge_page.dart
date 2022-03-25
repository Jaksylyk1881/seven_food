import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_food/data/cubit/fridge_cubit/fridge_cubit.dart';
import 'package:seven_food/data/models/fridge_changed/fridge_changed.dart';
import 'package:seven_food/data/models/fridge_closed/fridge_closed.dart';
import 'package:seven_food/data/models/fridge_opened/fridge_opened.dart';
import 'package:seven_food/data/repository/fridge_services.dart';
import 'package:seven_food/presentation/custom_icons/bottom_nav_icons.dart';
import 'package:seven_food/presentation/screens/main/main_list.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/presentation/widgets/letter_b.dart';
import 'package:seven_food/presentation/widgets/master_card_logo_for_card.dart';
import 'package:seven_food/presentation/widgets/visa_logo_for_card.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:seven_food/utils/constants.dart';

class FridgePage extends StatefulWidget {
  final int fridgeId;
  final int id;
  final int orderID;

  const FridgePage(
      {Key? key,
      required this.fridgeId,
      required this.id,
      required this.orderID,})
      : super(key: key);

  @override
  _FridgePageState createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  bool switchValue = false;
  late int fridgeID;
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    fridgeID = widget.fridgeId;
    BlocProvider.of<FridgeCubit>(context).initPusher(id);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<FridgeCubit>(context).unSubscribe(id);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              BlocProvider.of<FridgeCubit>(context).unSubscribe(id);
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          title: Text(
            "$fridgeID",
            style: const TextStyle(fontSize: 18),
          ),
        ),
        body: BlocConsumer<FridgeCubit, FridgeState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            if (state is FridgeOpenedState) {
              return buildMainFridgePage(
                fridgeOpened: state.fridgeOpened,
              );
            } else if (state is FridgeChangedState) {
              return buildMainFridgePage(
                fridgeOpened: state.fridgeOpened!,
                fridgeChanged: state.fridgeChanged,
              );
            } else if (state is FridgeClosedState) {
              return buildClosedPage(fridgeClosed: state.fridgeClosed);
            } else if (state is FridgeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is FridgeInitialState){
              return buildOpenedPage();
            }
            return buildOpenedPage();
          },
        ),
      ),
    );
  }

  Column buildClosedPage({required FridgeClosed fridgeClosed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 54, 0, 24),
              child: RoundedSuccess(
                horizontalPadding: 140,
              ),
            ),
            const Text(
              "Платеж оплачен",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: "ManropeBold",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Приятного аппетита",
              style: TextStyle(
                color: grey,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                children: [
                  LabelAndResult(
                    label: 'Сумма оплаты:',
                    result: fridgeClosed.data!.totalAmount!,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Оплачена с карты:",
                          style: textStyle,
                        ),
                        Row(
                          children: [
                            Text("••••${fridgeClosed.data!.card!.lastFour!}",            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "ManropeBold",
                              fontWeight: FontWeight.w600,
                            ),),
                            const SizedBox(width: 4,),
                            if (fridgeClosed.data!.card!.type=="Visa") SvgPicture.asset(
                              "icons/visa.svg",
                              color: Colors.blue,
                            ) else SvgPicture.asset(
                              "icons/mastercard.svg",
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  LabelAndResult(
                    label: 'Списано бонусов:',
                    result: fridgeClosed.data!.usedBonus!,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Начислено бонусов",
                          style: textStyle,
                        ),
                        Text(
                          fridgeClosed.data!.receivedBonus!,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontFamily: "ManropeBold",
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: BlueButton(
            callback: () {
              BlocProvider.of<FridgeCubit>(context).unSubscribe(id);
              Navigator.pushNamed(context, MainBottomList.id);
            },
            title: "НА ГЛАВНУЮ",
          ),
        )
      ],
    );
  }

  Center buildOpenedPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          RoundedSuccess(
            horizontalPadding: 100,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Холодильник открыт",
            style: textStyle2,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Потяните дверь, чтобы открыть ее",
            style: textStyle1,
          )
        ],
      ),
    );
  }

  Column buildMainFridgePage({
    required FridgeOpened fridgeOpened,
    FridgeChanged? fridgeChanged,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                child: fridgeChanged != null &&
                        fridgeChanged.products!.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: contentBackground,
                                    ),
                                    child: Center(
                                      child: Image.network(
                                        fridgeChanged.products![index].image!,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: Text(
                                          fridgeChanged.products![index].name!,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${fridgeChanged.products![index].price!} x${fridgeChanged.products![index].quantity!}",
                                            style: textStyle3,
                                          ),
                                          Text(
                                            fridgeChanged
                                                .products![index].price!,
                                            style: textStyle3,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                          itemCount: fridgeChanged.products!.length,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              const Icon(
                                BottomNavIcons.union,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 29,
                              ),
                              const Text(
                                "Список ваших заказов",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontFamily: "ManropeBold",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Возьмите продукт из холодильника, продукты появятся здесь автоматом",
                                style: TextStyle(
                                  color: grey,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Итого:"),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          fridgeChanged != null
                              ? fridgeChanged.totalAmount!
                              : "0 тг",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ManropeBold",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Бонусы:"),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          fridgeChanged != null
                              ? fridgeChanged.usedBonus!
                              : "0 тг",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ManropeBold",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                tileColor: contentBackground,
                leading: (fridgeOpened.cards![0].type=="Visa")?
                const VisaLogoForCard():const MasterCardLogoForCard(),
                title: const Text(
                  'Оплатить с карты',
                  style: textStyle3,
                ),
                trailing: Text(
                  fridgeOpened.cards![0].maskedPan!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                tileColor: contentBackground,
                leading: const LetterB(),
                title: const Text(
                  'Потратить бонусы',
                  style: textStyle3,
                ),
                subtitle: Text(
                  'Накоплено бонусов ${fridgeOpened.currentBonus}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                trailing: CupertinoSwitch(
                  activeColor: secondaryBlue,
                  value: switchValue,
                  onChanged: (newValue) {
                    switchValue = newValue;
                    FridgeService().purchasesUpdate(
                        orderID: widget.orderID,
                        usedCardId: fridgeOpened.cards![0].id!,
                        isBonusUsed: switchValue,);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: fridgeChanged != null && fridgeChanged.products!.isNotEmpty
              ? BlueButton(
                  disabledColor: lightGrey,
                  callback: null,
                  title: "ЗАКРОЙТЕ ХОЛОДИЛЬНИК",
                )
              : const BlueButton(
                  callback: null,
                  title: "ВОЗЬМИТЕ  ПРОДУКТЫ",
                ),
        )
      ],
    );
  }
}

class LabelAndResult extends StatelessWidget {
  final String label;
  final String result;

  const LabelAndResult({
    Key? key,
    required this.label,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: textStyle,
          ),
          Text(
            result,
            style: textStyle5,
          )
        ],
      ),
    );
  }
}

class RoundedSuccess extends StatelessWidget {
  final double horizontalPadding;

  const RoundedSuccess({
    Key? key,
    required this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width),
          ),
          child: Icon(
            Icons.check_sharp,
            color: Colors.green,
            size:
                (MediaQuery.of(context).size.width - (horizontalPadding * 2)) /
                    2,
          ),
        ),
      ),
    );
  }
}
