import 'package:equatable/equatable.dart';

class VdInfoEntity extends Equatable {
  final String vdUrl;
  final String vdText;
  final String vdTitle;
  final String vdImage ;

  const VdInfoEntity( {required this.vdUrl, required this.vdText, required this.vdTitle , required this.vdImage,});
  @override
  List<Object?> get props => [vdText, vdUrl, vdTitle , vdImage];
}
