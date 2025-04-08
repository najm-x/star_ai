import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/check_internet.dart';
import 'package:business_tools/features/summary/data/models/export_type_mod.dart';
import 'package:business_tools/features/summary/data/source/local/summary_local_source.dart';
import 'package:business_tools/features/summary/data/source/summary_remote_source.dart';
import 'package:business_tools/features/summary/domain/entities/summary_entity.dart';
import 'package:business_tools/features/summary/domain/entities/summary_store_entity.dart';
import 'package:business_tools/features/summary/domain/entities/vd_info_entity.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class SummaryRepoImp implements SummaryRepo {
  final SummaryRemoteSource remoteSource;
  final SummaryLocalSource localSource;

  const SummaryRepoImp({required this.remoteSource, required this.localSource});
  @override
  Future<Either<Failure, SummaryEntity>> summary(
      String text, String lang, String typeSummary, String lengthSummary, String titleVd) async {
    if (!(await checkInternet())) {
      return left(InternetFailure()) ; 
    }
    try {
      final response = await remoteSource.summary(text, lang, typeSummary, lengthSummary, titleVd);
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
    if (!(await checkInternet())) {
      return left(InternetFailure()) ; 
    }
    try {
      final response = await remoteSource.vdInfoEctract(vdId);
      return right(response);
    } catch (e) {
      return left(TransScriptVdFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> export(String summary, ExportTypeMod exportMod, String title, String lang) async {
    try {
      return right(await remoteSource.export(summary, exportMod, title, lang));
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Either<Failure, Unit>> addSummary(
      String vdTitle, String vdUrl, String vdLang, String summary, String vdImage) async {
    try {
      return right(await localSource.addSummary(
        vdTitle,
        vdUrl,
        vdLang,
        summary,
        vdImage,
      ));
    } catch (e) {
      return left(SaveFailure());
    }
  }

  @override
  Future<Either<Failure, List<SummaryStoreEntity>>> fetchListSummaries() async {
    try {
      return right(await localSource.fetchListSummaries());
    } catch (e) {
      return left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, SummaryStoreEntity>> getSummaryStored(int id) async {
    try {
      return right(await localSource.getSummaryStored(id));
    } catch (e) {
      return left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteSummary(int id) async {
    try {
      return right(await localSource.deleteSummary(id));
    } catch (e) {
      return left(EmptyFailure());
    }
  }
}
