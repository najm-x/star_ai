import 'package:flutter/material.dart';

class TextFormFiledLarg extends StatelessWidget {
  const TextFormFiledLarg({super.key, required this.hint, this.textEditingController, required this.circular});
final String hint ; 
final double circular ;
final TextEditingController? textEditingController ;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height / 2,
      child: ClipRRect(
        borderRadius:  BorderRadius.vertical(bottom: Radius.circular(circular)),
        child: SizedBox(
          child: TextFormField(
            controller: textEditingController,
            maxLines: 200,
            decoration: InputDecoration(
                filled: true,
                hintText: hint,
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
