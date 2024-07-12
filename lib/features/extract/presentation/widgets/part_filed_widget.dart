import 'package:business_tools/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class PartFiledWidget extends StatelessWidget {
  const PartFiledWidget({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        child: SizedBox(
          child: TextFormField(
            controller: textEditingController,
            maxLines: 200,
            decoration: InputDecoration(
                filled: true,
                hintText: "Paste Text Here",
                fillColor: AppColors.primaryContainer,
                border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                hoverColor: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
