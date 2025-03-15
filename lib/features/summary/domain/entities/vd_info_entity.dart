import 'package:equatable/equatable.dart';

class VdInfoEntity extends Equatable {
  final String vdUrl;
  final String vdText;
  final String vdTitle;

  const VdInfoEntity({required this.vdUrl, required this.vdText, required this.vdTitle});
  @override
  List<Object?> get props => [vdText, vdUrl, vdTitle];
}
