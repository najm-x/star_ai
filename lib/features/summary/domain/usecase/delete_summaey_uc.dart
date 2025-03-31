import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteSummaeyUc {
  final SummaryRepo summaryRepo ;

  DeleteSummaeyUc({required this.summaryRepo});
  Future<Either<Failure, Unit>> call(int id) async {
    return await summaryRepo.deleteSummary(id) ;
  }

}