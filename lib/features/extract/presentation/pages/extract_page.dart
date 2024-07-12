import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/features/extract/presentation/widgets/floating_action_widget.dart';
import 'package:business_tools/features/extract/presentation/widgets/part_filed_widget.dart';
import 'package:business_tools/features/extract/presentation/widgets/prt_down_widget.dart';
import 'package:flutter/material.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({super.key});

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    textEditingController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        PartFiledWidget(textEditingController: textEditingController),
        const PrtDownWidget(),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColors.primaryContainer,
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionWidget(text: textEditingController.text);
  }
}
