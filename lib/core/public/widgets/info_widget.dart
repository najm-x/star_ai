import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class InfoWidget extends StatelessWidget {
 final String text ;

  const InfoWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(7),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(6), color: Theme.of(context).colorScheme.errorContainer),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(
              UIcons.regularRounded.info,
              color: Theme.of(context).colorScheme.error,
              size: 14,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
           Expanded(
            child: Text(
            text,
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
