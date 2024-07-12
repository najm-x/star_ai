part of 'save_data_bloc.dart';

enum SaveDataStatus { init, loading, success, error }

final class SaveDataState extends Equatable {
  final String messageError;
  final String messageSuccess;
  final SaveDataStatus status;
  const SaveDataState({this.messageError = "", this.messageSuccess = "", this.status = SaveDataStatus.init});
  SaveDataState copyWith({
    String? messageError,
    String? messageSuccess,
    SaveDataStatus? status}
  ) {
    return SaveDataState(
        messageError: messageError ?? this.messageError,
        messageSuccess: messageSuccess ?? this.messageSuccess,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [];
}
