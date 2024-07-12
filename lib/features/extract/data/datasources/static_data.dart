import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/features/extract/data/models/type_file_save_model.dart';

class StaticDataEx {
  static List<TypeFileSaveModle> typeEmailSaveData = [
    TypeFileSaveModle(name: "JSON", isSelected: true),
    TypeFileSaveModle(name: "TEXT", isSelected: false),
  ];
  static List<TypeFileSaveModle> typeNumberSaveData = [
    TypeFileSaveModle(name: AppStrings.csv, isSelected: false),
    TypeFileSaveModle(name: AppStrings.json, isSelected: true),
    TypeFileSaveModle(name: AppStrings.text, isSelected: false),
  ];
}
