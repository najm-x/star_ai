import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/data/models/export_type_mod.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class ExportUc {
  final SummaryRepo summaryRepo;
  ExportUc({required this.summaryRepo});
  Future<Either<Failure, Unit>> call(String summary, ExportTypeMod exportMod, String title, String lang) async {
    return await summaryRepo.export(summary, exportMod, title, lang);
  }
}
