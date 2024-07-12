import 'package:business_tools/core/public/data/language_data.dart';
import 'package:flutter/material.dart';

class DropDownlangWidget extends StatelessWidget {
  final String title;
  final Function(dynamic)? onSelected;
  const DropDownlangWidget({super.key, required this.title, this.onSelected});
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      hintText: title,
      enableFilter: true,
      menuHeight: 200,
      width: 135,
      onSelected: onSelected,
      dropdownMenuEntries: languages
          .map((langName) => DropdownMenuEntry<String>(
                value: langName["lang"],
                label: langName["lang"],
              ))
          .toList(),
    );
  }
}
