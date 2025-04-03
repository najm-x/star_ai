import 'package:flutter/material.dart';

class TextFormFieldCu extends StatelessWidget {
  final String hint;
  final String? labelText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final bool? isCenter;
  final Widget? icon;
  const TextFormFieldCu(
      {super.key,
      required this.hint,
      this.labelText,
      this.validator,
      this.textEditingController,
      this.onTap,
      this.onFieldSubmitted,
      this.isCenter,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      textAlign: isCenter == null || isCenter == false ? TextAlign.start : TextAlign.center,
      onFieldSubmitted: onFieldSubmitted,
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
          isDense: true, border: const OutlineInputBorder(), labelText: labelText, hintText: hint, prefixIcon: icon),
    );
  }
}
