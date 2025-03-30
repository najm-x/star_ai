import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/data/models/summary_store_mod.dart';
import 'package:business_tools/features/summary/domain/entities/summary_store_entity.dart';
import 'package:business_tools/features/summary/domain/usecase/fetch_summaries_us.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'summary_home_state.dart';

class SummaryHomeCubit extends Cubit<SummaryHomeState> {
  final FetchSummariesUs fetchSummariesUs;
  SummaryHomeCubit({required this.fetchSummariesUs}) : super(SummaryHomeState());
  Future<void> fetch() async {
    emit(state.copyWith(status: SummaryHomeStatus.loading));
    await Future.delayed(Duration(seconds: 3));
    var fold = await fetchSummariesUs.call();
    emit(_handelFetch(fold));
  }

  SummaryHomeState _handelFetch(Either<Failure, List<SummaryStoreEntity>> fold) {
    return fold.fold((ifLeft) {
      return state.copyWith(status: SummaryHomeStatus.fetchError);
    }, (ifRight) {
      return state.copyWith(status: SummaryHomeStatus.fetchDone, summaries: ifRight as List<SummaryStoreMod>);
    });
  }
}
