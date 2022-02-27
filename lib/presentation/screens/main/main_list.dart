import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MainList extends StatefulWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async{
      SystemNavigator.pop();
      return true;
    },
    child: const Scaffold(body: SafeArea(child: Center(child: Text("Main page List")))));
  }
}
