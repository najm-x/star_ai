import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});


  @override
  Widget build(BuildContext context){
    return const Padding(padding: EdgeInsets.all(2), child: CircularProgressIndicator());
  }
}