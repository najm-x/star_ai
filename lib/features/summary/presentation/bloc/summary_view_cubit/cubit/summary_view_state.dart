part of 'summary_view_cubit.dart';

enum StateSummaryViewCubit { 
  init, loading, copy, reSummary, save, export , changeTextLtR
}

class SummaryViewCubitState extends Equatable {
  final StateSummaryViewCubit state;
  final bool textLtR ;
  const SummaryViewCubitState({this.state = StateSummaryViewCubit.init , this.textLtR = true});

  SummaryViewCubitState copyWith({StateSummaryViewCubit? state , bool? textLtR}) {
    return SummaryViewCubitState(
      state: state ?? this.state,
      textLtR: textLtR??this.textLtR
    );
  }

  @override
  List<Object> get props => [state];
}
