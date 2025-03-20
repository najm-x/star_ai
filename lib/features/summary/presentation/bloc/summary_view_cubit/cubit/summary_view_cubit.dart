import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'summary_view_state.dart';

class SummaryViewCubit extends Cubit<SummaryViewCubitState> {
  SummaryViewCubit() : super(SummaryViewCubitState());
  void changeLtR(bool textLtR) {
    emit(state.copyWith(state: StateSummaryViewCubit.loading));
    emit(state.copyWith(textLtR: !textLtR, state: StateSummaryViewCubit.changeTextLtR));
  }
  void copyText(String summary){
     emit(state.copyWith(state: StateSummaryViewCubit.loading));
    emit(state.copyWith( summary: summary, state: StateSummaryViewCubit.copy));
  }
}
