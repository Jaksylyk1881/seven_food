import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/cubit/history_cubit/history_cubit.dart';
import 'package:seven_food/data/models/history_main/history_main.dart';
import 'package:seven_food/data/models/history_main/history_main_details/history_main_detail.dart';
import 'package:seven_food/presentation/custom_icons/bottom_nav_icons.dart';

import 'package:seven_food/utils/colors.dart';
import 'package:seven_food/utils/utils.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
            "История",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "ManropeBold",
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (BuildContext context, state) {
          if (state is HistoryStateError) {
            buildShowError(context, state.message);
          }
        },
        builder: (BuildContext context, Object? state) {
          if (state is HistoryStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HistoryStateLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: (state.histories.isEmpty)?
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 2,color: lightGrey,
                              ),
                            ),
                            child: Center(
                              child: Icon(BottomNavIcons.union,color: lightGrey,size: 30,),
                            ),
                          ),
                          const SizedBox(height: 24,),
                          const Text("Список заказов пуст",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),),
                          const SizedBox(height: 2,),
                          const Text("Начните совершать покупки",style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                        ],
                      ),
                    ),
                  )
                  :ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final HistoryMain history = state.histories[index];
                  String? date;
                  if (index != 0) {
                    date = state.histories[index-1].createdAt?.substring(0, 10);
                  } else {
                    date = state.histories[index].createdAt?.substring(0, 10);
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: (index==0)?
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '${history.createdAt?.substring(0, 10)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: lightGrey,
                            ),
                          ),
                        )
                            :((date != history.createdAt?.substring(0, 10))
                            ? Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '${history.createdAt?.substring(0, 10)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: lightGrey,
                            ),
                          ),
                        )
                            : null),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          decoration: BoxDecoration(
                            color: contentBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '№${history.id}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "ManropeBold",
                                    ),
                                  ),
                                  Text(
                                    '${history.price}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "ManropeBold",
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${history.address}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: lightGrey,
                                      ),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: lightGrey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final HistoryMainDetail historyDetail =
                                        history.details![index];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${historyDetail.name}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: grey,
                                          ),
                                        ),
                                        Text(
                                          "${historyDetail.quantity}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: grey,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  itemCount: history.details?.length,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "СКАЧАТЬ ЧЕК",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: state.histories.length,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  // void getIds() async{
  //   List<History> ids = (await HistoryServices().getHistories()).cast<History>();
  //   for(History id in ids){
  //     print(id.toString());
  //   }
  // }
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HistoryCubit>(context).getHistories();
  }
}
