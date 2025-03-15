import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/domain/entities/vd_info_entity.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class VdInfoExctractUs {
  final SummaryRepo summaryRepo;
  VdInfoExctractUs({required this.summaryRepo});
  Future<Either<Failure, VdInfoEntity>> call(String vdId) {
    return summaryRepo.vdInfoEctract(vdId);
  }
}
