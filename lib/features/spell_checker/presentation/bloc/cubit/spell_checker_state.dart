part of 'spell_checker_cubit.dart';

enum SpellCheckerStatus { init, loading, successSpellChecker, changeLtR, successSave,  errorSpellChecker, errorOther, emptyOption }

final class SpellCheckerState extends Equatable {
  final String messageSuccess;
  final String messageError;
  final SpellCheckerStatus status;
  final String value;
  const SpellCheckerState(
      {this.messageSuccess = "", this.messageError = "", this.status = SpellCheckerStatus.init, this.value = ""});

  SpellCheckerState copyWith(
      {String? messageSuccess, String? messageError, SpellCheckerStatus? status, String? value}) {
    return SpellCheckerState(
        messageError: messageError ?? this.messageError,
        messageSuccess: messageSuccess ?? this.messageSuccess,
        status: status ?? this.status,
        value: value ?? this.value);
  }

  @override
  List<Object> get props => [messageError, messageSuccess, status, value];
}
