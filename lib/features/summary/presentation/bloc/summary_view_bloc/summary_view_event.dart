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
  final String vdLang ;
  const GetVdInfoEvent({required this.vdUrl, required this.vdLang});

  @override
  List<Object> get props => [vdUrl];
}
class GetSummaryStoredEvent extends SummaryViewEvent {
  final int id ; 
  const GetSummaryStoredEvent({required this.id});

  @override
  List<Object> get props => [id];
}