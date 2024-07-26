import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'vd_trans_type_state.dart';

class VdTransTypeCubit extends Cubit<VdTransTypeState> {
  int currentVdType = 0;
  VdTransTypeCubit() : super(const VdTransTypeState());
  void change(int value) {
    print("klk");
    emit(state.copyWith(status: VdTransTypeStatus.init));
    currentVdType = value;
    emit(state.copyWith(status: VdTransTypeStatus.vdTypeChange));
  }
}
