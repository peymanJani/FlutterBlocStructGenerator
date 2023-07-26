
part of 'periodic_services_bloc.dart';

abstract class PeriodicServicesEvent extends Equatable {
  const PeriodicServicesEvent();
}

class PeriodicServicesClickItemEvent extends PeriodicServicesEvent{
  @override
  List<Object?> get props => [];
}


