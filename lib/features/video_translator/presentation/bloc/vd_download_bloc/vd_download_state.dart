part of 'vd_download_bloc.dart';

enum VdDownloadStatus { init, loading, error, errorPermission, success }

final class VdDownloadState extends Equatable {
  final String messageError;
  final String messageSuccess;
  final VdDownloadStatus status;
  const VdDownloadState({this.messageError = "", this.messageSuccess = "", this.status = VdDownloadStatus.init});
  VdDownloadState copyWith({String? messageError, String? messageSuccess, VdDownloadStatus? status}) {
    return VdDownloadState(
        messageError: messageError ?? this.messageError,
        messageSuccess: messageSuccess ?? this.messageSuccess,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [messageError, messageSuccess, status];
}

