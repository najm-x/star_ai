import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: 0.4,
            minHeight: 15,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text("25%")
      ],
    );
  }
}
