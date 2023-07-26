
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeClickItemsEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}
class HomeClickProfileEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}


