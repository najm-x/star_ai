part of 'summary_view_bloc.dart';

sealed class SummaryViewEvent extends Equatable {
  const SummaryViewEvent();

  @override
  List<Object> get props => [];
}
class GetSummaryEvent extends SummaryViewEvent {
  final SummarySetupState data;
  final String textOfVd ;
  final String titleVd ; 
  const GetSummaryEvent( {required this.data , required this.textOfVd , required this.titleVd});

  @override
  List<Object> get props => [data,textOfVd , titleVd];
}
class GetVdInfoEvent extends SummaryViewEvent {
  final String vdUrl ; 
  const GetVdInfoEvent({required this.vdUrl});

  @override
  List<Object> get props => [vdUrl];
}