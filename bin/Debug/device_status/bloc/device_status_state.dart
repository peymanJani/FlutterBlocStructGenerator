part of 'device_status_bloc.dart';

class DeviceStatusState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<DeviceState>? devicestates;
List<Step>? steps;
int? pageIndex;

  DeviceState? devicestate;
Step? step;


  DeviceStatusState(
  {
  this.devicestates,this.devicestate,
this.steps,this.step,
this.pageIndex,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        devicestates,devicestate,
steps,step,
pageIndex,
msg,status,

      ];

DeviceStatusState copyWith({
    List<DeviceState>? devicestates,
List<Step>? steps,
int? pageIndex,

    DeviceState? devicestate,
Step? step,
    
  }) {
    return DeviceStatusState(
      devicestates: devicestates ?? this.devicestates,
 devicestate: devicestate ?? this.devicestate,
steps: steps ?? this.steps,
 step: step ?? this.step,
 pageIndex: pageIndex ?? this.pageIndex,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class DeviceStatusInitial extends DeviceStatusState {
  DeviceStatusInitial() {
    }
  }


