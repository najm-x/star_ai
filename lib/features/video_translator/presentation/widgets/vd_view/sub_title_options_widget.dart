import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubTitleOptionsWidget extends StatelessWidget {
  const SubTitleOptionsWidget({super.key, required this.subTitles});
  final List<VdTranslateEntities> subTitles;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VdViewCubit, VdViewState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _partOptin(
                  context: context,
                  title: AppLocalizations.of(context)!.fontSize,
                  value: context.read<VdViewCubit>().currentFontSize,
                  min: 10,
                  max: 32,
                  onChanged: (p0) {
                    context.read<VdViewCubit>().changeTextStyle(p0, null, null, null, null, null);
                  },
                ),
                _partOptin(
                  context: context,
                  title: AppLocalizations.of(context)!.backGround,
                  value: context.read<VdViewCubit>().currentBgOpacity,
                  min: 0,
                  max: 1,
                  divisions: 10,
                  onChanged: (p0) {
                    context.read<VdViewCubit>().changeTextStyle(null, p0, null, null, null, null);
                  },
                ),
                _partOptin(
                  context: context,
                  title: AppLocalizations.of(context)!.textColor,
                  value: context.read<VdViewCubit>().currentTextColor,
                  min: 0,
                  max: 5,
                  onChanged: (p0) {
                    context.read<VdViewCubit>().changeTextStyle(null, null, p0, null, null, null);
                  },
                ),
                _partOptin(
                  context: context,
                  title: AppLocalizations.of(context)!.bottomSpace,
                  value: context.read<VdViewCubit>().currentBottomSpace,
                  min: 0,
                  max: 70,
                  onChanged: (p0) {
                    context.read<VdViewCubit>().changeTextStyle(null, null, null, p0, null, null);
                  },
                ),
                _partOptin(
                  context: context,
                  title: AppLocalizations.of(context)!.textDirection,
                  value: context.read<VdViewCubit>().currentisLtoR ? 0 : 1,
                  min: 0,
                  max: 1,
                  onChanged: (p0) {
                    context.read<VdViewCubit>().changeTextStyle(null, null, null, null, p0 == 0, null);
                  },
                ),
                _partOptin(
                  context: context,
                  title: AppLocalizations.of(context)!.subtitleDelay,
                  value: context.read<VdViewCubit>().currentSubtitleDelay.toDouble(),
                  min: -30,
                  max: 30,
                  divisions: 100,
                  onChanged: (p0) {
                    context.read<VdViewCubit>().changeTextStyle(null, null, null, null, null, p0.toInt());
                    context.read<VdViewCubit>().changSubTitle(subTitles);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _partOptin(
      {required BuildContext context,
      required String title,
      required double value,
      required double min,
      required double max,
      int? divisions,
      required void Function(double)? onChanged}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child: Row(
        children: [
          Text(title),
          Expanded(
              child: SizedBox(
            child: Slider(
              value: value,
              min: min,
              max: max,
              label: "$value",
              divisions: divisions ?? (max - min).toInt(),
              onChanged: onChanged,
            ),
          ))
        ],
      ),
    );
  }
}
