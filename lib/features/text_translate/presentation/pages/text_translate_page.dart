import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/features/ads/presentation/widgets/ads_banner_widget.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:business_tools/features/text_translate/presentation/widgets/floating_action_button.dart';
import 'package:business_tools/features/text_translate/presentation/widgets/text_filed_widget.dart';
import 'package:business_tools/features/text_translate/presentation/widgets/translate_option_widget_texr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextTranslatePage extends StatelessWidget {
  const TextTranslatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.onPrimary,
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: _appBar(),
      body: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return SingleChildScrollView(
      controller: BlocProvider.of<TextTransCubit>(context).scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextFieldWidget(),
          Container(margin: const EdgeInsets.only(bottom: 0, top: 15), child: const AdsBannerWidget()),
          const TranslateOptionWidgetTexr(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _floatingActionButton() {
    return const FloatingActionButtonWidget();
  }
}
