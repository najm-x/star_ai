import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/core/public/widgets/add.dart';
import 'package:business_tools/core/public/widgets/text_form_filed_cu.dart';
import 'package:business_tools/features/extract/presentation/widgets/drop_down_widget.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              hint: AppStrings.infoText,
              labelText: AppStrings.info,
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
                  title: AppStrings.translateFrom,
                  onSelected: (langSelected) {
                    BlocProvider.of<TextTransCubit>(context).onSelectedLang(langSelected, AppStrings.translateFrom);
                  },
                ),
                DropDownlangWidget(
                  title: AppStrings.translateTo,
                  onSelected: (langSelected) {
                    BlocProvider.of<TextTransCubit>(context).onSelectedLang(langSelected, AppStrings.translateTo);
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
