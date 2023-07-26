
part of 'sensor_details_bloc.dart';

abstract class SensorDetailsEvent extends Equatable {
  const SensorDetailsEvent();
}

class SensorDetailsChangeDateValueEvent extends SensorDetailsEvent{
  @override
  List<Object?> get props => [];
}
class SensorDetailsClickGetChartByDateEvent extends SensorDetailsEvent{
  @override
  List<Object?> get props => [];
}


