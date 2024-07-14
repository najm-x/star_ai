import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/core/public/widgets/go_widget.dart';
import 'package:business_tools/features/extract/presentation/widgets/loading.dart';
import 'package:business_tools/features/spell_checker/presentation/bloc/cubit/spell_checker_cubit.dart';
import 'package:business_tools/features/spell_checker/presentation/widgets/spell_checker_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatActionSpellChecker extends StatelessWidget {
  const FloatActionSpellChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpellCheckerCubit, SpellCheckerState>(
      listener: (context, state) {
        if (state.status == SpellCheckerStatus.successSpellChecker) {
          showModalBottomSheet(
            isDismissible: false,
            context: context,
            builder: (context2) {
              return BlocProvider.value(
                  value: BlocProvider.of<SpellCheckerCubit>(context),
                  child: SpellCheckerBottomSheet(
                    value: state.value,
                  ));
            },
          );
        }
        if (state.status == SpellCheckerStatus.errorSpellChecker ||
            state.status == SpellCheckerStatus.errorOther ||
            state.status == SpellCheckerStatus.emptyOption) {
          CustomSnakBar().snackBarError(context, state.messageError, 3);
        }
        if (state.status == SpellCheckerStatus.successSave) {
          CustomSnakBar().snackBarSuccess(context, state.messageSuccess, 3);
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            elevation: 1,
            onPressed: () => context.read<SpellCheckerCubit>().spellTextChecker(),
            child: AnimatedSwitcher(
                duration: Durations.medium1,
                child: state.status == SpellCheckerStatus.loading
                    ? const Loading(
                        key: ValueKey(0),
                      )
                    : const GoWidget(
                        key: ValueKey(1),
                      )),
          ),
        );
      },
    );
  }
}
