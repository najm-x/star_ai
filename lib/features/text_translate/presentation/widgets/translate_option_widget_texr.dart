import 'package:business_tools/core/public/widgets/add.dart';
import 'package:business_tools/core/public/widgets/text_form_filed_cu.dart';
import 'package:business_tools/features/extract/presentation/widgets/drop_down_widget.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TranslateOptionWidgetTexr extends StatelessWidget {
  const TranslateOptionWidgetTexr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 160),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormFieldCu(
              hint: AppLocalizations.of(context)!.infoText,
              labelText: AppLocalizations.of(context)!.info,
              onTap: () => BlocProvider.of<TextTransCubit>(context).scrollDown(),
              onFieldSubmitted: (dd) => BlocProvider.of<TextTransCubit>(context).scrollUp(),
              textEditingController: BlocProvider.of<TextTransCubit>(context).infoCo,
            ),
            const SizedBox(
              height: 8,
            ),
            const Add(
              height: 70,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropDownlangWidget(
                  title: AppLocalizations.of(context)!.translateFrom,
                  onSelected: (langSelected) {
                    BlocProvider.of<TextTransCubit>(context)
                        .onSelectedLang(langSelected, AppLocalizations.of(context)!.translateFrom);
                  },
                ),
                DropDownlangWidget(
                  title: AppLocalizations.of(context)!.translateTo,
                  onSelected: (langSelected) {
                    BlocProvider.of<TextTransCubit>(context)
                        .onSelectedLang(langSelected, AppLocalizations.of(context)!.translateTo);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
