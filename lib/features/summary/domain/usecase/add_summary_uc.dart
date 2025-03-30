import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:dartz/dartz.dart';

class AddSummaryUc {
  final SummaryRepo summaryRepo ;

  AddSummaryUc({required this.summaryRepo});  
  Future<Either<Failure, Unit>> call(
      String vdTitle, String vdUrl, String vdLang, String summary , String vdImage ) async{
         return await summaryRepo.addSummary(vdTitle, vdUrl, vdLang, summary , vdImage)  ; 
      }
      


}