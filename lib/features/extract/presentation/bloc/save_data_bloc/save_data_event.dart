part of 'save_data_bloc.dart';

final class SaveDataEvent extends Equatable {
  final List<EmailsNumberaEntite> data ;
  final String type ;
  const SaveDataEvent( {required this.data , required this.type,});

  @override
  List<Object> get props => [data];
}
