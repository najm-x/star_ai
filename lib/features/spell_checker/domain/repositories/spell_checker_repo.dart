import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/spell_checker/domain/entities/spell_checker_entities.dart';
import 'package:dartz/dartz.dart';

abstract class SpellCheckerRepo {
  Future<Either<Failure, SpellCheckerEntities>> spellTextChecker(String text, String moreInfo);
  Future<Either<Failure, Unit>> saveText(String text);
}
