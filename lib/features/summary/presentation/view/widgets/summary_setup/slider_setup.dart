import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderSetup extends StatelessWidget {
  const SliderSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarySetupCubit, SummarySetupState>(
      buildWhen: (previous, current) => current.state == StateSetUp.changSzie,
      builder: (context, state) {
        return Slider(
          divisions: 4,
          value: context.read<SummarySetupCubit>().currentLen.toDouble(),
          min: 0,
          max: 3,
          onChanged: (value) {
            context.read<SummarySetupCubit>().changeSize(value);
          },
        );
      },
    );
  }
}
