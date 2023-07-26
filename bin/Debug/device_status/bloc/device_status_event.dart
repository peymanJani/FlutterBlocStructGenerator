
part of 'device_status_bloc.dart';

abstract class DeviceStatusEvent extends Equatable {
  const DeviceStatusEvent();
}

class DeviceStatusChangeStepEvent extends DeviceStatusEvent{
  @override
  List<Object?> get props => [];
}
class DeviceStatusClickSubmitEvent extends DeviceStatusEvent{
  @override
  List<Object?> get props => [];
}
class DeviceStatusChangeDesEvent extends DeviceStatusEvent{
  @override
  List<Object?> get props => [];
}


