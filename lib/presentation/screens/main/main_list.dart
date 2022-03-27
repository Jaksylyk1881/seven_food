import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_food/presentation/custom_icons/bottom_nav_icons.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/help_item/help_page.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/history_item/history_page.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/main_item/main_item.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/profile_item/profile_page.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/qr_item/qr_camera_page.dart';
import 'package:seven_food/utils/colors.dart';

class MainBottomList extends StatefulWidget {
  static const String id = '/main_list_screen';
  final int? pageId;

  const MainBottomList({
    Key? key,this.pageId,
  }) : super(key: key,);

  @override
  _MainBottomListState createState() => _MainBottomListState();
}

class _MainBottomListState extends State<MainBottomList> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const MainItem(),
    const HistoryPage(),
    Container(),
    const HelpPage(),
    const ProfilePage()
  ];

  @override
  void initState() {
    if(widget.pageId==null){
      _selectedIndex=0;
    }else{
      _selectedIndex=widget.pageId!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: _pages.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (index == 2) {
              Navigator.pushNamed(context, QrCameraPage.id);
            } else {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: unselectedItem,
          selectedLabelStyle:
              const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          selectedItemColor: selectedItem,
          elevation: 0,
          backgroundColor: bottomNavBarBackground,
          items: [
            BottomNavigationBarItem(
              backgroundColor: bottomNavBarBackground,
              icon: const Icon(BottomNavIcons.home),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              backgroundColor: bottomNavBarBackground,
              icon: const Icon(BottomNavIcons.bag),
              label: 'История',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Container(
                height: 52,
                width: 72,
                decoration: const BoxDecoration(
                  color: Color(0xff0D70E3),
                  borderRadius: BorderRadius.all(Radius.circular(44)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "icons/qr.svg",
                    semanticsLabel: 'QR Logo',
                  ),
                ),
              ),
              //   Container(
              //     margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 7),
              //     decoration: ShapeDecoration(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15),
              //         side: const BorderSide(
              //             width: 3,
              //             color: Colors.white,
              //         ),
              //       ),
              //     ),
              //     child: const Icon(
              //       BottomNavIcons.qrLogo,
              //       size: 20,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: bottomNavBarBackground,
              icon: const Icon(BottomNavIcons.chat),
              label: 'Помощь',
            ),
            BottomNavigationBarItem(
              backgroundColor: bottomNavBarBackground,
              icon: const Icon(BottomNavIcons.profile),
              label: 'Профиль',
            )
          ],
        ),
      ),
    );
  }
}
