part of 'home_cubit.dart';

enum HomeStatus { init, changePage }

class HomeState extends Equatable {
  final HomeStatus status;

  const HomeState({this.status = HomeStatus.init});

  HomeState copyWith({HomeStatus? status}) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}


