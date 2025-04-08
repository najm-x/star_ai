part of 'summary_view_bloc.dart';

enum ViewSummaryStates { init, loading, successGetVdInfo, successGetSummary, errorGetVdInfo, erroretSummary , successGetSummaryStored , errorGetSummaryStored   , networkError  }

class SummaryViewState extends Equatable {
  final VdInfoMod? vdInfoMod;
  final SummaryMod? summaryMod;
  final ViewSummaryStates state;
  final String lang; // Added lang variable

  const SummaryViewState({
    this.summaryMod,
    this.vdInfoMod,
    this.state = ViewSummaryStates.init,
    this.lang = "", // Initialize lang
  });

  SummaryViewState copyWith({
    VdInfoMod? vdInfoMod,
    SummaryMod? summaryMod,
    ViewSummaryStates? state,
    String? lang, // Add lang to copyWith
  }) {
    return SummaryViewState(
      state: state ?? this.state,
      vdInfoMod: vdInfoMod ?? this.vdInfoMod,
      summaryMod: summaryMod ?? this.summaryMod,
      lang: lang ?? this.lang, // Copy lang
    );
  }

  @override
  List<Object?> get props => [vdInfoMod, summaryMod, state, lang]; // Add lang to props
}
