import 'package:equatable/equatable.dart';

class VdTranslateEntities extends Equatable {
  final String subTitle;
  final Duration start;
  final Duration end;

  const VdTranslateEntities({required this.subTitle, required this.start, required this.end});
  @override
  List<Object?> get props => [subTitle, start, end];
}
