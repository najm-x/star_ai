import 'package:business_tools/core/public/widgets/go_widget.dart';
import 'package:business_tools/features/extract/presentation/bloc/extract_bloc/extract_bloc.dart';
import 'package:business_tools/features/extract/presentation/bloc/save_data_bloc/save_data_bloc.dart';
import 'package:business_tools/features/extract/presentation/widgets/dialog_widget.dart';
import 'package:business_tools/features/extract/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExtractBloc, ExtractState>(
      listener: (context, state) {
        if (state is SuccessExtract) {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (bottomSheetContext) {
              return BlocProvider.value(
                value: context.read<SaveDataBloc>(),
                child: BlocProvider.value(
                  value: context.read<ExtractBloc>(),
                  child: DialogWidget(
                    type: context.read<ExtractBloc>().typeFileSelexted,
                    data: state.data,
                  ),
                ),
              );
            },
          );
          debugPrint(state.data.first.value);
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            elevation: 1,
            onPressed: () => context
                .read<ExtractBloc>()
                .add(PhoneEmailExtractEvent(text: text, type: context.read<ExtractBloc>().typeExtractName)),
            child: AnimatedSwitcher(
                duration: Durations.medium1,
                child: state is LoadingExtract
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
