import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TextTransBottomSheet extends StatelessWidget {
  final String value;
 final void Function()? onPressed ;
  const TextTransBottomSheet({super.key, required this.value, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest),
              child: Center(
                child: SingleChildScrollView(
                  child: MarkdownBody(
                    data: value,
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
                  ),
                ),
              ),
            )),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: onPressed,
                child: const Text(
                  "save",
                ))
          ],
        ),
      ),
    );
  }
}
