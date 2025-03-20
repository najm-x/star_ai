import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'summary_view_state.dart';

class SummaryViewCubit extends Cubit<SummaryViewCubitState> {
  SummaryViewCubit() : super(SummaryViewCubitState());
}
