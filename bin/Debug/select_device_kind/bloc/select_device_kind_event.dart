
part of 'select_device_kind_bloc.dart';

abstract class SelectDeviceKindEvent extends Equatable {
  const SelectDeviceKindEvent();
}

class SelectDeviceKindClickItemsEvent extends SelectDeviceKindEvent{
  @override
  List<Object?> get props => [];
}
class SelectDeviceKindClickExitAccountEvent extends SelectDeviceKindEvent{
  @override
  List<Object?> get props => [];
}


