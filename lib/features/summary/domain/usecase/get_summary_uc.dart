import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/domain/entities/summary_store_entity.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class GetSummaryUc {
  final SummaryRepo summaryRepo ;

  GetSummaryUc({required this.summaryRepo});
  Future<Either<Failure, SummaryStoreEntity>> call(int id) async{
    return await summaryRepo.getSummaryStored(id) ;
  }

}