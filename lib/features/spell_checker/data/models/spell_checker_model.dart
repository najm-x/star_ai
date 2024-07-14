import 'package:business_tools/features/spell_checker/domain/entities/spell_checker_entities.dart';

class SpellCheckerModel extends SpellCheckerEntities {
  const SpellCheckerModel({required super.text});
  factory SpellCheckerModel.toModel(String text) {
    return SpellCheckerModel(text: text);
  }
}
