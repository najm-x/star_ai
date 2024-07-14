import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/handel_exceptions.dart';
import 'package:business_tools/features/spell_checker/data/datasources/spell_checker_remote_data.dart';
import 'package:business_tools/features/spell_checker/domain/entities/spell_checker_entities.dart';
import 'package:business_tools/features/spell_checker/domain/repositories/spell_checker_repo.dart';
import 'package:dartz/dartz.dart';

class SpellCheckerRepoImp implements SpellCheckerRepo {
  final SpellCheckerRemoteData spellCheckerRemoteData;

  SpellCheckerRepoImp({required this.spellCheckerRemoteData});

  @override
  Future<Either<Failure, Unit>> saveText(String text) async {
    try {
      return right(await spellCheckerRemoteData.saveText(text));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, SpellCheckerEntities>> spellTextChecker(String text, String moreInfo) async {
    try {
      return right(await spellCheckerRemoteData.spellTextChecker(text, moreInfo));
    } catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }
}
