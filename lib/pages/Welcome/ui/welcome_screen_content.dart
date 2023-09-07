import 'package:flutter/material.dart';
import 'package:watertrackerapp/utils/constants/color_lib.dart';

class WelcomeScreenContent extends StatelessWidget {
  const WelcomeScreenContent(
      {super.key,
      required this.image,
      this.title = "TITLE",
      this.subtitle = "SUBTITLE"});

  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.height * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: AppColor.softBlack,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColor.softBlack,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
