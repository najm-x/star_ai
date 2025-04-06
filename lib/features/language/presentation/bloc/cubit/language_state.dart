part of 'language_cubit.dart';

enum LanguageStatus { init, success, successChangTheme }

final class LanguageState extends Equatable {
  final LanguageStatus status;
  final String value;
  const LanguageState({this.status = LanguageStatus.init, this.value = ""});
  LanguageState copyWith({LanguageStatus? status, String? value}) {
    return LanguageState(status: status ?? this.status, value: value ?? this.value);
  }

  @override
  List<Object> get props => [value, status];
}
