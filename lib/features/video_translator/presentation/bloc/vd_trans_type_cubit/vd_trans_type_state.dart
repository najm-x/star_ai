part of 'vd_trans_type_cubit.dart';

enum VdTransTypeStatus { init, vdTypeChange }

final class VdTransTypeState extends Equatable {
  final VdTransTypeStatus status;
  const VdTransTypeState({this.status = VdTransTypeStatus.init});
  VdTransTypeState copyWith({VdTransTypeStatus? status}) {
    return VdTransTypeState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
