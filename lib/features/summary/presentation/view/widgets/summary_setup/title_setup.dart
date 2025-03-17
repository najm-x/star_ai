import 'package:flutter/material.dart';

class TitleSetup extends StatelessWidget {
  const TitleSetup({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title),
    );
  }
}
