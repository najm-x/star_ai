import 'package:flutter/material.dart';

class TextFormFieldCu extends StatelessWidget {
  final String hint;
  final String labelText;
  final TextEditingController? textEditingController ;
  final String? Function(String?)? validator;
  final void Function()? onTap ;
  final Function(String)? onFieldSubmitted ;
  const TextFormFieldCu({super.key, required this.hint, required this.labelText, this.validator, this.textEditingController, this.onTap, this.onFieldSubmitted});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      
     onFieldSubmitted: onFieldSubmitted,
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(isDense: true, border: const OutlineInputBorder(), labelText: labelText, hintText: hint),
    );
  }
}
