part of 'text_extract_bloc.dart';

enum TextExtractStatus {
  init,
  loading,
  errorTextExtract,
  successTextExtract,
  errorPickImage,
  successPickImage,
  loadingCropImage,
  errorCropImage,
  successCropImage
}

final class TextExtractState extends Equatable {
  final String messageError;
  final String messageSuccess;
  final String value;
  final TextExtractStatus status;
  const TextExtractState(
      {this.messageError = "", this.messageSuccess = "", this.value = "", this.status = TextExtractStatus.init});
  TextExtractState copyWith({String? messageError, String? messageSuccess, String? value, TextExtractStatus? status}) {
    return TextExtractState(
        messageError: messageError ?? this.messageError,
        messageSuccess: messageSuccess ?? this.messageSuccess,
        value: value ?? this.value,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [messageError, messageSuccess, value, status];
}
