part of 'vd_translate_bloc.dart';

sealed class VdTranslateEvent extends Equatable {
  const VdTranslateEvent();

  @override
  List<Object> get props => [];
}

final class VdTranslate extends VdTranslateEvent {
  final String videoId;
  final String translateFrom;
  final String translateTo;
  final String translateFromCode;
  const VdTranslate(
      {required this.videoId,
      required this.translateFrom,
      required this.translateTo,
      required this.translateFromCode});

  @override
  List<Object> get props => [videoId, translateFrom, translateTo, translateFromCode];
}
