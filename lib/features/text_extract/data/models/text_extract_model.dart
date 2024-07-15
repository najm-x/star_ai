import 'package:business_tools/features/text_extract/domain/entities/text_extract_entities.dart';

class TextExtractModel extends TextExtractEntities {
  const TextExtractModel({required super.text});
  factory TextExtractModel.toModel (String text) {
    return TextExtractModel(text: text) ; 
  }
}