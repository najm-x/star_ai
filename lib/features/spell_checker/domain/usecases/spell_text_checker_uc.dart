import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/spell_checker/domain/entities/spell_checker_entities.dart';
import 'package:business_tools/features/spell_checker/domain/repositories/spell_checker_repo.dart';
import 'package:dartz/dartz.dart';

class SpellTextCheckerUc {
  final SpellCheckerRepo spellCheckerRepo;

  SpellTextCheckerUc({required this.spellCheckerRepo});
  Future<Either<Failure, SpellCheckerEntities>> call(String text, String moreInfo) async {
    return spellCheckerRepo.spellTextChecker(text, moreInfo);
  }
}
