import 'package:flutter/material.dart';
import 'package:seven_food/data/models/slider_model.dart';
import 'package:seven_food/presentation/screens/login/login_screen.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';

class OnBoardingPage extends StatefulWidget {
  static const String id = '/onboarding_screen';

  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<SliderModel> slides = [];
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    slides = SliderModel.getSlides();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return PageMaket(
                image: slides[index].image,
              );
            },
          ),
          Positioned(
            right: 15,
            left: 15,
            bottom: 50,
            child: BlueButton(
              callback: () {
                if (currentIndex == slides.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              title: (currentIndex == slides.length - 1) ? "Войти" : "Далее",
            ),
          ),
          Positioned(
            top: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 16,
            right: 16,
            child: Text(
              slides[currentIndex].title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "ManropeBold",
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 35 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.blue : const Color(0x26ffffff),
      ),
    );
  }
}

class PageMaket extends StatelessWidget {
  final String image;

  const PageMaket({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.4),
        )
      ],
    );
  }
}
