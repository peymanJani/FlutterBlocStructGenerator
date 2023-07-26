part of 'select_device_kind_bloc.dart';

class SelectDeviceKindState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<DeviceKind>? devicekinds;
bool? showExit;

  DeviceKind? devicekind;


  SelectDeviceKindState(
  {
  this.devicekinds,this.devicekind,
this.showExit,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        devicekinds,devicekind,
showExit,
msg,status,

      ];

SelectDeviceKindState copyWith({
    List<DeviceKind>? devicekinds,
bool? showExit,

    DeviceKind? devicekind,
    
  }) {
    return SelectDeviceKindState(
      devicekinds: devicekinds ?? this.devicekinds,
 devicekind: devicekind ?? this.devicekind,
 showExit: showExit ?? this.showExit,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class SelectDeviceKindInitial extends SelectDeviceKindState {
  SelectDeviceKindInitial() {
    }
  }


