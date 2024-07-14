import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/core/functions/check_permission.dart';
import 'package:business_tools/core/functions/copy_text.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/features/spell_checker/presentation/bloc/cubit/spell_checker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

class SpellCheckerBottomSheet extends StatelessWidget {
  final String value;
  const SpellCheckerBottomSheet({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpellCheckerCubit, SpellCheckerState>(
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
                        textDirection: context.read<SpellCheckerCubit>().isLtR ? TextDirection.ltr : TextDirection.rtl,
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
                    CustomSnakBar().snackBarSuccess(context, AppStrings.doneCopy, 2);
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
        Text(AppStrings.editeDirection),
        Switch(
          value: context.read<SpellCheckerCubit>().isLtR,
          onChanged: (value) => context.read<SpellCheckerCubit>().changeLtR(value),
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
                context.read<SpellCheckerCubit>().saveText(value);
              }
            },
            child: Text(
              AppStrings.save,
            )),
        OutlinedButton(onPressed: () => context.pop(), child: Text(AppStrings.cancel))
      ],
    );
  }
}
