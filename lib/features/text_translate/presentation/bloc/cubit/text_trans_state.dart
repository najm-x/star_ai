part of 'text_trans_cubit.dart';

enum TextTransStatus {
  init,
  loading,
  successTransleate,
  successCopy,
  successSave,
  errorTransleate,
  errorCopy,
  errorSave,
}

final class TextTransState extends Equatable {
  final String messageSuccess;
  final String messageError;
  final String value;
  final TextTransStatus status;
  const TextTransState(
      {this.messageSuccess = "", this.messageError = "", this.status = TextTransStatus.init, this.value = ""});
  TextTransState copyWith({String? messageSuccess, String? messageError, String? value, TextTransStatus? status}) {
    return TextTransState(
        messageSuccess: messageSuccess ?? this.messageSuccess,
        messageError: messageError ?? this.messageError,
        value: value ?? this.value,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [messageError, messageSuccess, status, value];
}
