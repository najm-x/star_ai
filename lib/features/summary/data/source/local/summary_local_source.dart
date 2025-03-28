import 'package:business_tools/core/database/sq_lite_helper.dart';
import 'package:business_tools/core/database/sql_keys.dart';
import 'package:business_tools/features/summary/data/models/summary_store_mod.dart';
import 'package:dartz/dartz.dart';

abstract class SummaryLocalSource {
  Future<Unit> addSummary(String vdTitle, String vdUrl, String vdLang, String summary);
  Future<List<SummaryStoreMod>> fetchListSummaries();
  Future<SummaryStoreMod> getSummaryStored(int id);
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

  @override
  Future<List<SummaryStoreMod>> fetchListSummaries() async {
    try {
      List<Map<String, Object?>> data = await sqLiteHelper.getQuery(SqliteKeys.summary.summaryTable, '1=?', [1]);
      if ((data.isEmpty)) {
        throw UnimplementedError();
      }
      List<SummaryStoreMod> listSummary = [];
      for (var summary in data) {
        listSummary.add(SummaryStoreMod.fromJson(summary));
      }
      return listSummary;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<SummaryStoreMod> getSummaryStored(int id) async {
    try {
      List<Map<String, Object?>> data =
          await sqLiteHelper.getQuery(SqliteKeys.summary.summaryTable, '${SqliteKeys.summary.id}=?', [id]);
      if ((data.isEmpty)) {
        throw UnimplementedError();
      }

      return SummaryStoreMod.fromJson(data[0]);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
