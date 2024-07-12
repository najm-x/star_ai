import 'package:equatable/equatable.dart';

class EmailsNumberaEntite extends Equatable {
  final String value;

  const EmailsNumberaEntite({required this.value});
  @override
  List<Object?> get props => [value];
}
