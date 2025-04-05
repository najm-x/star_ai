import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SliderSetup extends StatelessWidget {
  const SliderSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarySetupCubit, SummarySetupState>(
      buildWhen: (previous, current) => current.state == StateSetUp.changSzie,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.short,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 8), // مسافة بين النص والسلايدر
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  inactiveTrackColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  trackHeight: 6,
                  thumbColor: Theme.of(context).colorScheme.secondary,
                  overlayColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
                ),
                child: Slider(
                  divisions: 3,
                  value: context.read<SummarySetupCubit>().currentLen.toDouble(),
                  min: 0,
                  max: 3,
                  onChanged: (value) {
                    context.read<SummarySetupCubit>().changeSize(value);
                  },
                ),
              ),
            ),
            SizedBox(width: 8), // مسافة بين النص والسلايدر
            Text(
              AppLocalizations.of(context)!.tall,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        );
      },
    );
  }
}
