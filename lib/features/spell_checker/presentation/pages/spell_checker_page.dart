import 'package:business_tools/core/public/widgets/text_form_filed_larg.dart';
import 'package:business_tools/features/ads/presentation/widgets/ads_banner_widget.dart';
import 'package:business_tools/features/spell_checker/presentation/bloc/cubit/spell_checker_cubit.dart';
import 'package:business_tools/features/spell_checker/presentation/widgets/float_action_spell_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpellCheckerPage extends StatelessWidget {
  const SpellCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: _appBar(),
      body: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormFiledLarg(
            hint: AppLocalizations.of(context)!.pasteTextHere,
            circular: 30,
            textEditingController: BlocProvider.of<SpellCheckerCubit>(context).textCo,
          ),
          const SizedBox(
            height: 10,
          ),
          const AdsBannerWidget()
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _floatingActionButton() {
    return const FloatActionSpellChecker();
  }
}
