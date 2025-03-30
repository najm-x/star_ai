import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/data/models/export_type_mod.dart';
import 'package:business_tools/features/summary/domain/usecase/add_summary_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/export_uc.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
part 'summary_view_state.dart';

class SummaryViewCubit extends Cubit<SummaryViewCubitState> {
  final ExportUc exportUc;
  final AddSummaryUc addSummaryUc;
  SummaryViewState? data;
  SummaryViewCubit({required this.exportUc, required this.addSummaryUc}) : super(SummaryViewCubitState());
  void changeLtR(bool textLtR) {
    emit(state.copyWith(state: StateSummaryViewCubit.loading));
    emit(state.copyWith(textLtR: !textLtR, state: StateSummaryViewCubit.changeTextLtR));
  }

  void copyText(String summary) {
    emit(state.copyWith(state: StateSummaryViewCubit.loading));
    emit(state.copyWith(summary: summary, state: StateSummaryViewCubit.copy));
  }

  void reSummary() {
    emit(state.copyWith(state: StateSummaryViewCubit.loading));
    emit(state.copyWith(state: StateSummaryViewCubit.reSummary));
  }

  Future<void> export(String summary, ExportTypeMod exportMod, String title, String lang) async {
    emit(state.copyWith(state: StateSummaryViewCubit.loading));
    var fold = await exportUc.call(summary, exportMod, title, lang);
    emit(_handelExport(fold));
  }

  Future<void> save() async {
    emit(state.copyWith(state: StateSummaryViewCubit.loading));
    if (data == null || data?.summaryMod == null) {
      emit(state.copyWith(state: StateSummaryViewCubit.save));
      return;
    }

    var fold = await addSummaryUc.call(data?.vdInfoMod?.vdTitle ?? "", data?.vdInfoMod?.vdUrl ?? "", data?.lang ?? "",
        data?.summaryMod?.summary ?? "", data?.vdInfoMod?.vdImage ?? '');
    emit(_handelSave(fold));
  }

  SummaryViewCubitState _handelExport(Either<Failure, Unit> fold) {
    return fold.fold((ifLeft) {
      return state.copyWith(state: StateSummaryViewCubit.errorExport);
    }, (ifRight) {
      return state.copyWith(state: StateSummaryViewCubit.export);
    });
  }

  SummaryViewCubitState _handelSave(Either<Failure, Unit> fold) {
    return fold.fold((ifLeft) {
      return state.copyWith(state: StateSummaryViewCubit.saveError);
    }, (ifRight) {
      return state.copyWith(state: StateSummaryViewCubit.save);
    });
  }
}
