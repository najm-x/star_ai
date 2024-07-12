import 'package:business_tools/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class GoWidget extends StatelessWidget {
  const GoWidget({super.key});


  @override
  Widget build(BuildContext context){
    return  SizedBox(
      height: 60,
      width: 60,
      child: Center(
        child: Text(AppStrings.gO),
      ),
    );
  }
}