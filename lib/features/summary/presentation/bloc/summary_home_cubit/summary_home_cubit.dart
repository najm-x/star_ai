import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/data/models/summary_store_mod.dart';
import 'package:business_tools/features/summary/domain/entities/summary_store_entity.dart';
import 'package:business_tools/features/summary/domain/usecase/delete_summaey_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/fetch_summaries_us.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'summary_home_state.dart';

class SummaryHomeCubit extends Cubit<SummaryHomeState> {
  final FetchSummariesUs fetchSummariesUs;
  final DeleteSummaeyUc deleteSummaeyUc;
  SummaryHomeCubit({required this.fetchSummariesUs, required this.deleteSummaeyUc}) : super(SummaryHomeState());
  Future<void> fetch() async {
    emit(state.copyWith(status: SummaryHomeStatus.loading));
    await Future.delayed(Duration(milliseconds: 1500));
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

  Future<void> deleteSummary(int id) async {
    emit(state.copyWith(status: SummaryHomeStatus.loading));
    await Future.delayed(Duration(milliseconds: 1000));
    var fold = await deleteSummaeyUc.call(id);
    emit(_handelDelete(fold));
  }

  SummaryHomeState _handelDelete(Either<Failure, Unit> fold) {
    return fold.fold((ifLeft) {
      return state;
    }, (ifRight) {
      fetch();
      return state;
    });
  }
}
