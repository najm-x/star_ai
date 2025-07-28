import 'package:business_tools/core/functions/copy_text.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_tools/l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TextExtractedWidget extends StatelessWidget {
  final String value;
  const TextExtractedWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextExtractBloc, TextExtractState>(
      builder: (context, state) {
        return _markDownPart(context);
      },
    );
  }

  Widget _markDownPart(BuildContext context) {
    return Container(
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Theme.of(context).colorScheme.surfaceContainer),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: MarkdownBody(
                      data: value,
                      styleSheet: MarkdownStyleSheet.fromTheme(
                        Theme.of(context),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () async {
                  copyText(value);
                  CustomSnakBar().snackBarSuccess(context, AppLocalizations.of(context)!.doneCopy, 2);
                },
                icon: const Icon(Icons.copy_rounded))
          ],
        ));
  }
}
