import 'package:equatable/equatable.dart';

class SpellCheckerEntities extends Equatable {
  final String text;
  const SpellCheckerEntities({required this.text});
  @override
  List<Object?> get props => [text];
}
