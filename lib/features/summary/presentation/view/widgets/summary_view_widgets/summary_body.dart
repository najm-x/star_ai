import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_cubit/cubit/summary_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SummaryBody extends StatelessWidget {
  const SummaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryViewBloc, SummaryViewState>(
      builder: (context, state) {
        return BlocBuilder<SummaryViewCubit, SummaryViewCubitState>(
          builder: (context, state2) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Directionality(
                      textDirection: state2.textLtR ? TextDirection.rtl : TextDirection.ltr,
                      child: MarkdownBody(selectable: true, data: state.summaryMod?.summary ?? "")),
                ),
                SizedBox(height: 150,)
              ],
            );
          },
        );
      },
    );
  }
}
