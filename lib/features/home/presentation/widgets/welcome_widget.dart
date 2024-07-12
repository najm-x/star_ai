import 'package:business_tools/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: width / 5),
      child: Image.asset(AppImages.welcome),
    );
  }
}
