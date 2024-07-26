import 'package:business_tools/core/public/widgets/text_form_filed_cu.dart';
import 'package:business_tools/features/extract/presentation/widgets/drop_down_widget.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:showcaseview/showcaseview.dart';

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
            Showcase(
              key: BlocProvider.of<TextTransCubit>(context).three,
              description: AppLocalizations.of(context)!.addmoreInfoText,
              child: TextFormFieldCu(
                hint: AppLocalizations.of(context)!.infoText,
                labelText: AppLocalizations.of(context)!.info,
                onTap: () => BlocProvider.of<TextTransCubit>(context).scrollDown(),
                onFieldSubmitted: (dd) => BlocProvider.of<TextTransCubit>(context).scrollUp(),
                textEditingController: BlocProvider.of<TextTransCubit>(context).infoCo,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Showcase(
              key: BlocProvider.of<TextTransCubit>(context).tow,
              description: AppLocalizations.of(context)!.chooselangToTransText,
              
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Theme.of(context).colorScheme.secondary)),
                child: Column(
                  children: [
                    _title(context),
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
