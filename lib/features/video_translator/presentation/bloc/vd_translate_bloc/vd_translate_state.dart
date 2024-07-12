part of 'vd_translate_bloc.dart';

sealed class VdTranslateState extends Equatable {
  const VdTranslateState();

  @override
  List<Object> get props => [];
}

final class VdTranslateInitial extends VdTranslateState {}

final class SuccessVdTranslate extends VdTranslateState {
  final List<VdTranslateEntities> data;

  const SuccessVdTranslate({required this.data});
  @override
  List<Object> get props => [data];
}

final class LoadingVdTranslate extends VdTranslateState {
 final double  translationProgress ;

 const LoadingVdTranslate({required this.translationProgress});
   @override
  List<Object> get props => [translationProgress];

}

final class ErrorVdTranslate extends VdTranslateState {
  final String messageError ;

  const ErrorVdTranslate({required this.messageError});
  @override
  List<Object> get props => [messageError];
}
