import 'package:business_tools/core/database/sq_lite_helper.dart';
import 'package:business_tools/core/database/sql_keys.dart';
import 'package:business_tools/features/summary/data/models/summary_store_mod.dart';
import 'package:dartz/dartz.dart';

abstract class SummaryLocalSource {
  Future<Unit> addSummary(String vdTitle, String vdUrl, String vdLang, String summary);
}

class SummaryLocalSourceImp implements SummaryLocalSource {
  final SQLiteHelper sqLiteHelper;

  SummaryLocalSourceImp({required this.sqLiteHelper});
  @override
  Future<Unit> addSummary(String vdTitle, String vdUrl, String vdLang, String summary) async {
    try {
      await sqLiteHelper.insert(SqliteKeys.summary.summaryTable,
          SummaryStoreMod(summary: summary, vdLang: vdLang, vdTitle: vdTitle, vdUrl: vdUrl, id: null).toMap());
      return unit;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
