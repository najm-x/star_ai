import 'package:dartz/dartz.dart';

abstract class SummaryLocalSource {
  Future<Unit> addSummary(String vdTitle, String vdUrl, String vdLang, String summary);
}

class SummaryLocalSourceImp implements SummaryLocalSource {
  
  @override
  Future<Unit> addSummary(String vdTitle, String vdUrl, String vdLang, String summary) {
    // TODO: implement addSummary
    throw UnimplementedError();
  }
  
}
