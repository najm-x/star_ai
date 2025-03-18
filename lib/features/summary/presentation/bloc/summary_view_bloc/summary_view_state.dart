part of 'summary_view_bloc.dart';

enum ViewSummaryStates { init, loading, successGetVdInfo, successGetSummary, errorGetVdInfo, erroretSummary }

class SummaryViewState extends Equatable {
  final VdInfoMod? vdInfoMod;
  final SummaryMod? summaryMod;
  final ViewSummaryStates state ;

  const SummaryViewState({ this.summaryMod,  this.vdInfoMod , this.state = ViewSummaryStates.init});

  SummaryViewState copyWith({VdInfoMod? vdInfoMod, SummaryMod? summaryMod , ViewSummaryStates? state}) {
    return SummaryViewState(
      state: state??this.state,
      vdInfoMod: vdInfoMod ?? this.vdInfoMod,
      summaryMod: summaryMod ?? this.summaryMod, 

    );
  }

  @override
  List<Object?> get props => [vdInfoMod, summaryMod , state];
}
