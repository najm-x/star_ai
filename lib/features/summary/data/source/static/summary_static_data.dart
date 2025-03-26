import 'package:business_tools/features/summary/data/models/export_type_mod.dart';

class SummaryStaticData {
  static const List<String> summaryTypes = ["Key points summary", "Q&A ", "Paragraph-based summary"];

  static const List<String> summaryLen = ["Very short", "Short", "Medium", "Detailed"];
  static final List<ExportTypeMod> exportType = [ExportTypeMod(mimeType: "application/pdf", type: "pdf") , ExportTypeMod(type: "txt", mimeType:"text/plain" )];
}
