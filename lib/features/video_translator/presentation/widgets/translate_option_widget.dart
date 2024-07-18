import 'package:business_tools/core/constant/types_validate.dart';
import 'package:business_tools/features/extract/presentation/widgets/drop_down_widget.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TranslateOptionWidget extends StatelessWidget {
  const TranslateOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), border: Border.all(color: Theme.of(context).colorScheme.secondary)),
      child: Column(
        children: [
          _title(context),
          Row(
            children: [
              DropDownlangWidget(
                title: AppLocalizations.of(context)!.translateFrom,
                onSelected: (langSelected) {
                  BlocProvider.of<VdTranslateBloc>(context).onSelectOption(TypesValidate.from, langSelected!);
                },
              ),
              const Spacer(),
              DropDownlangWidget(
                  title: AppLocalizations.of(context)!.translateTo,
                  onSelected: (langSelected) =>
                      BlocProvider.of<VdTranslateBloc>(context).onSelectOption(TypesValidate.to, langSelected!)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(
          AppLocalizations.of(context)!.translateOption,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
