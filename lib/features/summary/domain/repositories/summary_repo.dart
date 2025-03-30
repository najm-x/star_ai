import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/data/models/export_type_mod.dart';
import 'package:business_tools/features/summary/domain/entities/summary_entity.dart';
import 'package:business_tools/features/summary/domain/entities/summary_store_entity.dart';
import 'package:business_tools/features/summary/domain/entities/vd_info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SummaryRepo {
  Future<Either<Failure, VdInfoEntity>> vdInfoEctract(String vdId);
  Future<Either<Failure, SummaryEntity>> summary(
      String text, String lang, String typeSummary, String lengthSummary, String titleVd);
  Future<Either<Failure, Unit>> export(String summary, ExportTypeMod exportMod, String title, String lang);
  Future<Either<Failure, List<SummaryStoreEntity>>> fetchListSummaries();
  Future<Either<Failure, Unit>> addSummary(String vdTitle, String vdUrl, String vdLang, String summary , String vdImage);
  Future<Either<Failure, SummaryStoreEntity>> getSummaryStored(int id);
}
