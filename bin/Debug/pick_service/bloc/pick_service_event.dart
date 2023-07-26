
part of 'pick_service_bloc.dart';

abstract class PickServiceEvent extends Equatable {
  const PickServiceEvent();
}

class PickServiceClickTabsEvent extends PickServiceEvent{
  @override
  List<Object?> get props => [];
}
class PickServiceClickItemsEvent extends PickServiceEvent{
  @override
  List<Object?> get props => [];
}
class PickServiceClickBackEvent extends PickServiceEvent{
  @override
  List<Object?> get props => [];
}


