part of 'check_cubit.dart';

enum CheckStatus {init, loading, internetError, addedApiKey,apiKeyWorking  , apiKeyDontWorking,  }

final class CheckState extends Equatable {
  final CheckStatus status;
  const CheckState({this.status = CheckStatus.init});
  CheckState copyWith({CheckStatus? status}) {
    return CheckState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
