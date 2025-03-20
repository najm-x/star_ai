import 'package:business_tools/features/summary/presentation/bloc/summary_view_cubit/cubit/summary_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeTextLtRWidget extends StatelessWidget {
  const ChangeTextLtRWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryViewCubit, SummaryViewCubitState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(),
            ListTile(
              title: Text("Text Direction"),
              trailing: Switch(
                value: state.textLtR,
                onChanged: (value) {
                  context.read<SummaryViewCubit>().changeLtR(!value);
                },
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
