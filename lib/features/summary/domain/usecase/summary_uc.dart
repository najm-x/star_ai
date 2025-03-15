import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/domain/entities/summary_entity.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class SummaryUc {
  final SummaryRepo summaryRepo ; 
 SummaryUc({required this.summaryRepo}) ;
 Future<Either<Failure,SummaryEntity >> call(String text , String lang , String typeSummary, String lengthSummary){
  return  summaryRepo.summary(text, lang, typeSummary, lengthSummary) ;
 } 
}