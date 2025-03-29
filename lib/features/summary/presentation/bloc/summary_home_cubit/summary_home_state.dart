part of 'summary_home_cubit.dart';

enum SummaryHomeStatus { inti, loading, fetchDone, fetchError, deleteError, deleteDone }

class SummaryHomeState extends Equatable {
  final SummaryHomeStatus status;
  final List<SummaryStoreMod>? summaries;

  const SummaryHomeState({this.status = SummaryHomeStatus.inti, this.summaries});

  SummaryHomeState copyWith({
    SummaryHomeStatus? status,
    List<SummaryStoreMod>? summaries,
  }) {
    return SummaryHomeState(
      status: status ?? this.status,
      summaries: summaries ?? this.summaries,
    );
  }

  @override
  List<Object?> get props => [status, summaries];
}