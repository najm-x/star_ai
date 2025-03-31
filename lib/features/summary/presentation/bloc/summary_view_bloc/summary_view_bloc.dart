import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/data/models/summary_mod.dart';
import 'package:business_tools/features/summary/data/models/vd_info_mod.dart';
import 'package:business_tools/features/summary/domain/entities/summary_entity.dart';
import 'package:business_tools/features/summary/domain/entities/summary_store_entity.dart';
import 'package:business_tools/features/summary/domain/entities/vd_info_entity.dart';
import 'package:business_tools/features/summary/domain/usecase/get_summary_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/summary_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/vd_info_exctract_us.dart';
import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'summary_view_event.dart';
part 'summary_view_state.dart';

class SummaryViewBloc extends Bloc<SummaryViewEvent, SummaryViewState> {
  final SummaryUc summaryUc;
  final VdInfoExctractUs vdInfoExctractUs;
  final GetSummaryUc getSummaryUc;
  String summary = "";
  SummaryViewBloc({required this.summaryUc, required this.vdInfoExctractUs, required this.getSummaryUc})
      : super(SummaryViewState()) {
    on<SummaryViewEvent>((event, emit) {});
    on<GetSummaryEvent>(_getSummaryEvent);
    on<GetVdInfoEvent>(_getVdInfoEvent);
    on<GetSummaryStoredEvent>(_getSummaryStoredEvent);
  }

  Future<void> _getVdInfoEvent(GetVdInfoEvent event, Emitter<SummaryViewState> emit) async {
    var fold = await vdInfoExctractUs.call(event.vdUrl);
    emit(_getVdSubtitleHndeling(fold));
    emit(state.copyWith(lang: event.vdLang)) ;
  }

  SummaryViewState _getVdSubtitleHndeling(Either<Failure, VdInfoEntity> fold) {
    return fold.fold((ifLeft) => state.copyWith(state: ViewSummaryStates.errorGetVdInfo),
        (ifRight) => state.copyWith(state: ViewSummaryStates.successGetVdInfo, vdInfoMod: ifRight as VdInfoMod));
  }

  Future<void> _getSummaryEvent(GetSummaryEvent event, Emitter<SummaryViewState> emit) async {
    var fold = await summaryUc.call(
        event.textOfVd, event.data.lang, event.data.summaryType, event.data.summarylen.toString(), event.titleVd);
    emit(_getSummaryHndeling(fold));
    summary = state.summaryMod?.summary ?? "";
  }

  SummaryViewState _getSummaryHndeling(Either<Failure, SummaryEntity> fold) {
    return fold.fold((ifLeft) => state.copyWith(state: ViewSummaryStates.erroretSummary),
        (ifRight) => state.copyWith(state: ViewSummaryStates.successGetSummary, summaryMod: ifRight as SummaryMod));
  }

  Future<void> _getSummaryStoredEvent(GetSummaryStoredEvent event, Emitter<SummaryViewState> emit) async {
    var fold = await getSummaryUc.call(event.id);
    emit(_getSummaryStoredeHndeling(fold));
  }

  SummaryViewState _getSummaryStoredeHndeling(Either<Failure, SummaryStoreEntity> fold) {
    return fold.fold((ifLeft) => state.copyWith(state: ViewSummaryStates.errorGetSummaryStored), (value) {
      summary = value.summary;
      return state.copyWith(
          state: ViewSummaryStates.successGetSummaryStored,
          vdInfoMod: VdInfoMod(vdUrl: value.vdUrl, vdText: "", vdTitle: value.vdTitle, vdImage: value.vdImage),
          lang: value.vdLang,
          summaryMod: SummaryMod(summary: value.summary));
    });
  }
}
