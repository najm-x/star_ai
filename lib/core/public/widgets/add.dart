import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  const Add({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all()),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "AD",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 70,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(30),
            ),
          )
        ],
      )),
    );
  }
}
