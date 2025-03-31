import 'package:business_tools/core/database/sql_keys.dart';
import 'package:business_tools/features/summary/domain/entities/summary_store_entity.dart';

class SummaryStoreMod extends SummaryStoreEntity {
  const SummaryStoreMod(
      {required super.vdTitle,
      required super.vdUrl,
      required super.vdLang,
      required super.summary,
      required super.id,
      required super.vdImage});
  Map<String, Object?> toMap() {
    return {
      SqliteKeys.summary.vdTitleColumn: vdTitle,
      SqliteKeys.summary.vdLangColumn: vdLang,
      SqliteKeys.summary.vdUrlColumn: vdUrl,
      SqliteKeys.summary.summaryContentColumn: summary,
      SqliteKeys.summary.vdImageColumn: vdImage
    };
  }

  factory SummaryStoreMod.fromJson(Map<String, Object?> json) {
    return SummaryStoreMod(
        vdTitle: json[SqliteKeys.summary.vdTitleColumn].toString(),
        vdUrl: json[SqliteKeys.summary.vdUrlColumn].toString(),
        vdLang: json[SqliteKeys.summary.vdLangColumn].toString(),
        summary: json[SqliteKeys.summary.summaryContentColumn].toString(),
        id: json[SqliteKeys.summary.id] as int,
        vdImage: json[SqliteKeys.summary.vdImageColumn].toString());
  }
}
