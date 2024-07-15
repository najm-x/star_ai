import 'package:equatable/equatable.dart';

class TextExtractEntities extends Equatable {
  final String text;

  const TextExtractEntities({required this.text});
  @override
  // TODO: implement props
  List<Object?> get props => [text];
}
