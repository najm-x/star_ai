import 'package:business_tools/features/text_translate/domain/entities/text_trans_entities.dart';

class TextTransModel extends TextTransEntities {
  const TextTransModel({required super.text});
  factory TextTransModel.toModel(Map<String, dynamic> data) {
    return TextTransModel(text: data["text"]);
  }
}
