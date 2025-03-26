import 'package:bloc/bloc.dart';
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/features/summary/data/models/export_type_mod.dart';
import 'package:business_tools/features/summary/domain/usecase/export_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
part 'summary_view_state.dart';

class SummaryViewCubit extends Cubit<SummaryViewCubitState> {
  final ExportUc exportUc ;
  SummaryViewCubit({required this.exportUc}) : super(SummaryViewCubitState());
  void changeLtR(bool textLtR) {
    emit(state.copyWith(state: StateSummaryViewCubit.loading));
    emit(state.copyWith(textLtR: !textLtR, state: StateSummaryViewCubit.changeTextLtR));
  }

  void copyText(String summary) {
    emit(state.copyWith(state: StateSummaryViewCubit.loading));
    emit(state.copyWith(summary: summary, state: StateSummaryViewCubit.copy));
  }

  Future<void> export(String summary, ExportTypeMod exportMod , String title , String lang) async {
   emit(state.copyWith(state: StateSummaryViewCubit.loading )) ;
   var fold = await  exportUc.call(summary, exportMod, title, lang) ; 
    emit(_handelExport(fold)) ;

  }
  SummaryViewCubitState _handelExport(Either<Failure, Unit> fold){
    return fold.fold((ifLeft){
      return  state.copyWith(state: StateSummaryViewCubit.errorExport)   ;
    }, (ifRight){
      return state.copyWith(state: StateSummaryViewCubit.export) ;
    }) ;
  }

}
