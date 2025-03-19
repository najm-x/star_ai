import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/data/source/summary_remote_source.dart';
import 'package:business_tools/features/summary/domain/entities/summary_entity.dart';
import 'package:business_tools/features/summary/domain/entities/vd_info_entity.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class SummaryRepoImp implements SummaryRepo {
  final SummaryRemoteSource remoteSource;

  const SummaryRepoImp({required this.remoteSource});
  @override
  Future<Either<Failure, SummaryEntity>> summary(
      String text, String lang, String typeSummary, String lengthSummary , String titleVd) async {
    try {
      final response = await remoteSource.summary(text, lang, typeSummary, lengthSummary , titleVd);
      return right(response);
    } catch (e) {
      if (e is AIException) {
        return left(AIFailure(message: e.messageError));
      }
      return left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, VdInfoEntity>> vdInfoEctract(String vdId) async {
    try {
      final response = await remoteSource.vdInfoEctract(vdId);
      return right(response);
    } catch (e) {
      return left(TransScriptVdFailure());
    }
  }
}
