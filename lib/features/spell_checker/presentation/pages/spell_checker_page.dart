import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/core/public/widgets/add.dart';
import 'package:business_tools/core/public/widgets/text_form_filed_larg.dart';
import 'package:business_tools/features/spell_checker/presentation/bloc/cubit/spell_checker_cubit.dart';
import 'package:business_tools/features/spell_checker/presentation/widgets/float_action_spell_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            hint: AppStrings.pasteTextHere,
            circular: 30,
            textEditingController: BlocProvider.of<SpellCheckerCubit>(context).textCo,
          ),
          SizedBox(
            height: 10,
          ),
          Add(height: 150)
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
