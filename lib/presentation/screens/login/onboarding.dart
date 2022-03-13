import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:seven_food/data/models/slider_model.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';

class OnBoardingPage extends StatefulWidget {
  static const String id = '/onboarding_screen';
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  
  List<SliderModel> slides = [];
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    slides = SliderModel.getSlides();
    _pageController = PageController( );
    _pageController.addListener(() {
      if (_pageController.page!.round().toInt() != currentIndex) {
        setState(() {
          currentIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: slides.length,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return PageMaket(
                title: slides[index].title,
                image: slides[index].image,);
          },),
     Positioned(
       bottom: 50,
       child: BlueButton(callback: (){
         if(currentIndex == slides.length - 1){
           log("da");
         }
         _pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
       }, title: (currentIndex == slides.length-1)?"Войти":"Далее",),
     )
    ],);
  }
}

class PageMaket extends StatelessWidget {
  final String image;
  final String title;
  const PageMaket(
      {Key? key,
      required this.title,
      required this.image,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
