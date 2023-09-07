import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/welcome', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBg,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/img/mainLogo.png'),
                const Text(
                  'Drops Water Tracker',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.softWhite,
                      fontSize: 24,
                      fontFamily: 'Poppins'),
                ),
                const Text(
                  'Stay hidrated and track your \n daily water intake',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: AppColor.softWhite,
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                JumpingDots(
                  color: AppColor.softWhite,
                  radius: 10,
                  numberOfDots: 4,
                  delay: 200,
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/img/splashwater2.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/img/splashwater1.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
