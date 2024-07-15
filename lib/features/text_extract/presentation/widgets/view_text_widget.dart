import 'package:business_tools/core/public/widgets/loading.dart';
import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:business_tools/features/text_extract/presentation/widgets/text_extracted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewTextWidget extends StatelessWidget {
  const ViewTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextExtractBloc, TextExtractState>(
      builder: (context, state) {
        return AnimatedSwitcher(
            duration: Durations.medium1,
            child: state.status == TextExtractStatus.loading
                ? const Loading(key: ValueKey(0))
                : state.status == TextExtractStatus.successTextExtract
                    ? TextExtractedWidget(key: const ValueKey(1), value: state.value)
                    : const SizedBox(
                        key: ValueKey(2),
                      ));
      },
    );
  }
}
