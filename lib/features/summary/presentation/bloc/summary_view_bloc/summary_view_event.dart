part of 'summary_view_bloc.dart';

sealed class SummaryViewEvent extends Equatable {
  const SummaryViewEvent();

  @override
  List<Object> get props => [];
}
class GetSummaryEvent extends SummaryViewEvent {
  final SummarySetupState data;
  final String textOfVd ; 
  const GetSummaryEvent({required this.data , required this.textOfVd});

  @override
  List<Object> get props => [data];
}
class GetVdInfoEvent extends SummaryViewEvent {
  final String vdUrl ; 
  const GetVdInfoEvent({required this.vdUrl});

  @override
  List<Object> get props => [vdUrl];
}