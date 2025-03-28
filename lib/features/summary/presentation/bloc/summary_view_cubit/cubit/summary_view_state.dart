part of 'summary_view_cubit.dart';

enum StateSummaryViewCubit { 
  init, loading, copy, reSummary, save, export , changeTextLtR , errorExport , saveError
}

class SummaryViewCubitState extends Equatable {
  final StateSummaryViewCubit state;
  final bool textLtR ;
  final String summary;
  const SummaryViewCubitState({
    this.state = StateSummaryViewCubit.init,
    this.textLtR = true,
    this.summary = '',
  });

  SummaryViewCubitState copyWith({StateSummaryViewCubit? state , bool? textLtR , String? summary}) {
    return SummaryViewCubitState(
      state: state ?? this.state,
     summary: summary??this.summary,
      textLtR: textLtR??this.textLtR
    );
  }

  @override
  List<Object> get props => [state];
}
