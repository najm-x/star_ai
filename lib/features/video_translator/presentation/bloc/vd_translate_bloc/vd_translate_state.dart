part of 'vd_translate_bloc.dart';

enum VdTranslateStatus {
  init,
  loading,
  error,
  errorPickFile,
  successVdTranslate,
  successTransCript,
  successGetTransFromFile,
}

final class VdTranslateState extends Equatable {
  final VdTranslateStatus status;
  final double translationProgress;
  final String infoLoading;
  final String messageError;
  final DataVdModel? onSuccessTransCript;
  final List<VdTranslateEntities>? onSuccessVdTranslate;
  final List<VdTranslateEntities>? onSuccessGetTransFromFile;

  const VdTranslateState(
      {this.status = VdTranslateStatus.init,
      this.translationProgress = 0,
      this.infoLoading = "",
      this.messageError = "",
      this.onSuccessTransCript,
      this.onSuccessVdTranslate,
      this.onSuccessGetTransFromFile});
  VdTranslateState copyWith(
      {VdTranslateStatus? status,
      double? translationProgress,
      String? infoLoading,
      String? messageError,
      DataVdModel? onSuccessTransCript,
      List<VdTranslateEntities>? onSuccessVdTranslate,
      List<VdTranslateEntities>? onSuccessGetTransFromFile}) {
    return VdTranslateState(
        status: status ?? this.status,
        translationProgress: translationProgress ?? this.translationProgress,
        infoLoading: infoLoading ?? this.infoLoading,
        messageError: messageError ?? this.messageError,
        onSuccessTransCript: onSuccessTransCript,
        onSuccessVdTranslate: onSuccessVdTranslate,
        onSuccessGetTransFromFile: onSuccessGetTransFromFile);
  }

  @override
  List<Object> get props => [status, translationProgress, infoLoading, messageError];
}
