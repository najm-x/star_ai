part of 'extract_bloc.dart';

sealed class ExtractEvent extends Equatable {
  const ExtractEvent();

  @override
  List<Object> get props => [];
}

final class PhoneEmailExtractEvent extends ExtractEvent {
  final String text;
  final String type;
  const PhoneEmailExtractEvent({
    required this.text,
    required this.type,
  });
  @override
  List<Object> get props => [text, type];
}
final class SaveFile extends ExtractEvent {
 final List<EmailsNumberaEntite> data ;
 final String type ; 
  const SaveFile( {required this.data , required this.type,});
  @override
  List<Object> get props => [data];
}

final class ChangeTypeExtract extends ExtractEvent {
  const ChangeTypeExtract();
  @override
  List<Object> get props => [];
}

final class ChangeTypeFile extends ExtractEvent {
  final String value;
  const ChangeTypeFile({required this.value});
  @override
  List<Object> get props => [value];
}


