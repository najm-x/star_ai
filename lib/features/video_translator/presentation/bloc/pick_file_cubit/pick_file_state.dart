part of 'pick_file_cubit.dart';

enum PickFileStatus { init, loading, error, success }

final class PickFileState extends Equatable {
  final PickFileStatus status;
  final String messageError;
  final String filePath;
  const PickFileState({this.status = PickFileStatus.init, this.messageError = "", this.filePath = ""});
  PickFileState copyWith({
    PickFileStatus? status,
    String? messageError,
    String? filePath,
  }) {
    return PickFileState(
        status: status ?? this.status,
        messageError: messageError ?? this.messageError,
        filePath: filePath ?? this.filePath);
  }

  @override
  List<Object> get props => [status, filePath, messageError];
}
