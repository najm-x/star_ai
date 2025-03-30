import 'package:equatable/equatable.dart';

class SummaryStoreEntity extends Equatable {
  final String? id;
  final String vdTitle;
  final String vdUrl;
  final String vdLang;
  final String vdImage;
  final String summary;

  const SummaryStoreEntity(
      {required this.vdTitle,
      required this.vdUrl,
      required this.vdLang,
      required this.summary,
      this.id,
      required this.vdImage});

  @override
  List<Object?> get props => [vdLang, vdTitle, vdUrl, summary, id , vdImage];
}
