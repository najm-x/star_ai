import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/features/text_translate/presentation/widgets/floating_action_button.dart';
import 'package:business_tools/features/text_translate/presentation/widgets/text_filed_widget.dart';
import 'package:business_tools/features/text_translate/presentation/widgets/translate_option_widget_texr.dart';
import 'package:flutter/material.dart';

class TextTranslatePage extends StatelessWidget {
  const TextTranslatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    print(size.height);
    return Scaffold(
      resizeToAvoidBottomInset: size.height >= 800 ? false : true,
      backgroundColor: AppColors.onPrimary,
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: _appBar(),
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Column(
      children: [
        TextFieldWidget(),
        TranslateOptionWidgetTexr(),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _floatingActionButton() {
    return const FloatingActionButtonWidget();
  }
}
