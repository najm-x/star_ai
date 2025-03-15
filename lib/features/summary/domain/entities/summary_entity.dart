import 'package:equatable/equatable.dart';

class SummaryEntity extends Equatable {
 final String summary ;
  const SummaryEntity({required this.summary});
  @override
  List<Object?> get props => [summary];
}