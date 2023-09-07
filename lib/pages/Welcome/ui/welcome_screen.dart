import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:watertrackerapp/pages/Welcome/ui/welcome_screen_content.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController controller = PageController();
  final List<Widget> welcomeScreenContent = [
    const WelcomeScreenContent(
      image: 'assets/img/welcomeScreen1.png',
      title: "Track your daily water \n intake with Us.",
      subtitle: "Achieve your hydration goals with a simple tap!",
    ),
    const WelcomeScreenContent(
      image: 'assets/img/welcomeScreen2.png',
      title: "Smart Reminders \n Tailored to You",
      subtitle:
          "Quick and easy to set your hydration goal & then track your daily water intake progress.",
    ),
    const WelcomeScreenContent(
      image: 'assets/img/welcomeScreen3.png',
      title: "Easy to Use – Drink, Tap, Repeat",
      subtitle: "Staying hydrated every day is easy with Drops Water Tracker.",
    ),
  ];

  int activeStep = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    padEnds: true,
                    onPageChanged: (value) {
                      setState(() {
                        activeStep = value;
                      });
                    },
                    pageSnapping: true,
                    controller: controller,
                    itemCount: welcomeScreenContent.length,
                    itemBuilder: (context, index) {
                      return welcomeScreenContent[index];
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: welcomeScreenContent.length,
                  effect: const WormEffect(
                      dotHeight: 5,
                      dotWidth: 10,
                      type: WormType.thinUnderground),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      activeStep < welcomeScreenContent.length - 1
                          ? controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.bounceInOut)
                          : Navigator.pushNamedAndRemoveUntil(
                              context, '/main', (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        backgroundColor: AppColor.mainBg),
                    child: Text(
                      activeStep < welcomeScreenContent.length - 1
                          ? 'NEXT'
                          : 'GET STARTED',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.softWhite),
                    )),
              ))
        ],
      ),
    );
  }
}
