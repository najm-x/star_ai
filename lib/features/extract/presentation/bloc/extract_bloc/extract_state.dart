part of 'extract_bloc.dart';

sealed class ExtractState extends Equatable {
  const ExtractState();

  @override
  List<Object> get props => [];
}

final class ExtractInitial extends ExtractState {}

final class LoadingExtract extends ExtractState {}

final class SuccessExtract extends ExtractState {
  final List<EmailsNumberaEntite> data;

  const SuccessExtract({required this.data});
  @override
  List<Object> get props => [data];
}

final class ErrorExtract extends ExtractState {
  final String messageError;

  const ErrorExtract({required this.messageError});
  @override
  List<Object> get props => [messageError];
}

final class DoneChanged extends ExtractState {
  final String value;

  const DoneChanged({required this.value});
  @override
  List<Object> get props => [value];
}

final class SuccessSave extends ExtractState {
  final String messageSuccess;
  const SuccessSave({required this.messageSuccess});
  @override
  List<Object> get props => [];
}

final class ErrorSave extends ExtractState {
  final String messageError;
  const ErrorSave({required this.messageError});
  @override
  List<Object> get props => [messageError];
}
