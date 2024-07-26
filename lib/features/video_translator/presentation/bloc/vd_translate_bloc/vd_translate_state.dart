part of 'vd_translate_bloc.dart';

enum VdTranslateStatus { init, loading, error, successVdTranslate, successTransCript }

final class VdTranslateState extends Equatable {
  final VdTranslateStatus status;
  final double translationProgress;
  final String infoLoading;
  final String messageError;
  final DataVdModel? onSuccessTransCript;
  final List<VdTranslateEntities>? onSuccessVdTranslate;

  const VdTranslateState(
      {this.status = VdTranslateStatus.init,
      this.translationProgress = 0,
      this.infoLoading = "",
      this.messageError = "",
      this.onSuccessTransCript,
      this.onSuccessVdTranslate});
  VdTranslateState copyWith(
      {VdTranslateStatus? status,
      double? translationProgress,
      String? infoLoading,
      String? messageError,
      DataVdModel? onSuccessTransCript,
      List<VdTranslateEntities>? onSuccessVdTranslate}) {
    return VdTranslateState(
        status: status ?? this.status,
        translationProgress: translationProgress ?? this.translationProgress,
        infoLoading: infoLoading ?? this.infoLoading,
        messageError: messageError ?? this.messageError,
        onSuccessTransCript: onSuccessTransCript,
        onSuccessVdTranslate: onSuccessVdTranslate);
  }

  @override
  List<Object> get props => [status, translationProgress, infoLoading, messageError];
}

// final class VdTranslateInitial extends VdTranslateState {}

// final class SuccessVdTranslate extends VdTranslateState {
//   final List<VdTranslateEntities> data;

//   const SuccessVdTranslate({required this.data});
//   @override
//   List<Object> get props => [data];
// }

// final class LoadingVdTranslate extends VdTranslateState {
//   final double translationProgress;
//   final String? infoLoading;

//   const LoadingVdTranslate({required this.translationProgress, this.infoLoading});
//   @override
//   List<Object> get props => [translationProgress];
// }

// final class ErrorVdTranslate extends VdTranslateState {
//   final String messageError;

//   const ErrorVdTranslate({required this.messageError});
//   @override
//   List<Object> get props => [messageError];
// }
