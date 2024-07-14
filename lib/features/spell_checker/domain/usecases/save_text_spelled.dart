import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/spell_checker/domain/repositories/spell_checker_repo.dart';
import 'package:dartz/dartz.dart';

class SaveTextSpelled {
  final SpellCheckerRepo spellCheckerRepo;

  SaveTextSpelled({required this.spellCheckerRepo});
  Future<Either<Failure, Unit>> call(String text) async {
    return spellCheckerRepo.saveText(text);
  }
}
