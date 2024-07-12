import 'package:business_tools/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class DecWidget extends StatelessWidget {
  const DecWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 10),
      child: Text(
          AppStrings.descreption ,
        textAlign: TextAlign.center,
      ),
    );
  }
}
