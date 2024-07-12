import 'package:flutter/material.dart';

class TextFormFiledLarg extends StatelessWidget {
  const TextFormFiledLarg({super.key, required this.hint, required this.maxLines, this.validator, this.textEditingController});
final String hint ; 
final int maxLines ; 
final TextEditingController? textEditingController ;
final String? Function(String?)? validator ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      maxLines: maxLines,
      validator: validator ,
      decoration:  InputDecoration(
          isDense: true, border: const OutlineInputBorder(), hintText: hint),
    );
  }
}
