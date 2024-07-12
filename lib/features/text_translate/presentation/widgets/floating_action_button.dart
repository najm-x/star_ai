import 'package:business_tools/core/functions/check_permission.dart';
import 'package:business_tools/core/public/widgets/go_widget.dart';
import 'package:business_tools/features/extract/presentation/widgets/loading.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:business_tools/features/text_translate/presentation/widgets/text_trans_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextTransCubit, TextTransState>(
      listener: (context, state) {
        if (state.status == TextTransStatus.successTransleate) {
          showModalBottomSheet(
            context: context,
            builder: (context2) {
              return BlocProvider.value(value: BlocProvider.of<TextTransCubit>(context) , child: TextTransBottomSheet(
                value: state.value,
                onPressed: () async {
                  await checkPermission(context);
                  // ignore: use_build_context_synchronously
                  context.read<TextTransCubit>().savetranslate(state.value);
                },
              ),);
            },
          );
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            elevation: 1,
            onPressed: () => context.read<TextTransCubit>().translateText(),
            child: AnimatedSwitcher(
                duration: Durations.medium1,
                child: state.status == TextTransStatus.loading
                    ? const Loading(
                        key: ValueKey(0),
                      )
                    : const GoWidget(
                        key: ValueKey(0),
                      )),
          ),
        );
      },
    );
  }
}
