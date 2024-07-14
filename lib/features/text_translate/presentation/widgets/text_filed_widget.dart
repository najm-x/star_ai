import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height / 2,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        child: SizedBox(
          child: TextFormField(
            controller: BlocProvider.of<TextTransCubit>(context).textCo,
            maxLines: 200,
            decoration: InputDecoration(
                filled: true,
                hintText: AppStrings.pasteTextHere,
                fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
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
