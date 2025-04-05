part of 'home_cubit.dart';

enum HomeStatus { init, changePage }

class HomeState extends Equatable {
  final HomeStatus status;
  final int selectedPage;

  const HomeState({this.status = HomeStatus.init, this.selectedPage = 0});

  HomeState copyWith({HomeStatus? status, int? selectedPage}) {
    return HomeState(status: status ?? this.status, selectedPage: selectedPage ?? this.selectedPage);
  }

  @override
  List<Object> get props => [status, selectedPage];
}
