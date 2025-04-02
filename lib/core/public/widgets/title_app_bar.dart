// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, required this.iconData, required this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.9),
                Theme.of(context).colorScheme.primary.withOpacity(0.6),
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                blurRadius: 6,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        Text(text),
      ],
    );
  }
}
