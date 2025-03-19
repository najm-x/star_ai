import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/domain/entities/summary_entity.dart';
import 'package:business_tools/features/summary/domain/entities/vd_info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SummaryRepo {
 Future<Either<Failure,VdInfoEntity >>  vdInfoEctract(String vdId) ;
  Future<Either<Failure,SummaryEntity >> summary(String text , String lang , String typeSummary, String lengthSummary , String titleVd) ;
}