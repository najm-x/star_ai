import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/domain/entities/summary_store_entity.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSummariesUs {
  final SummaryRepo summaryRepo;

  FetchSummariesUs({required this.summaryRepo});
    Future<Either<Failure, List<SummaryStoreEntity>>> call ()async{
     return await summaryRepo.fetchListSummaries();
    }

}