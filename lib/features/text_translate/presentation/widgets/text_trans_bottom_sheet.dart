import 'package:business_tools/core/functions/check_permission.dart';
import 'package:business_tools/core/functions/copy_text.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class TextTransBottomSheet extends StatelessWidget {
  final String value;
  const TextTransBottomSheet({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextTransCubit, TextTransState>(
      builder: (context, state) {
        return SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _markDownPart(context),
                _space(),
                _textDirection(context),
                _space(),
                _buttonsSaveAndCancel(context)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _space() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget _markDownPart(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26), color: Theme.of(context).colorScheme.surfaceContainerHighest),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Directionality(
                        textDirection: context.read<TextTransCubit>().isLtR ? TextDirection.ltr : TextDirection.rtl,
                        child: MarkdownBody(
                          data: value,
                          styleSheet: MarkdownStyleSheet.fromTheme(
                            Theme.of(context),
                          ),
                        )),
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
          )),
    );
  }

  Widget _textDirection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppLocalizations.of(context)!.editeDirection),
        Switch(
          value: context.read<TextTransCubit>().isLtR,
          onChanged: (value) => context.read<TextTransCubit>().changeLtR(value),
        )
      ],
    );
  }

  Widget _buttonsSaveAndCancel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FilledButton(
            onPressed: () async {
              if (await checkPermission(context)) {
                // ignore: use_build_context_synchronously
                context.read<TextTransCubit>().savetranslate(value);
              }
            },
            child: Text(
              AppLocalizations.of(context)!.save,
            )),
        OutlinedButton(onPressed: () => context.pop(), child: Text(AppLocalizations.of(context)!.cancel))
      ],
    );
  }
}
