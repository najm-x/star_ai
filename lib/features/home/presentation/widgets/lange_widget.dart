import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class LangeWidget extends StatelessWidget {
const LangeWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    
    return ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                UIcons.regularRounded.angle_down,
                size: 13,
              ),
              label: const Text("En"));
  }
}