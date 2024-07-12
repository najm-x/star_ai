import 'package:equatable/equatable.dart';

class TextTransEntities  extends Equatable{
  final String  text  ;
  

  const TextTransEntities({required this.text});
  @override
  // TODO: implement props
  List<Object?> get props => [text];

}