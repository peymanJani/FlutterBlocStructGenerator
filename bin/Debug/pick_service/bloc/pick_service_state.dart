part of 'pick_service_bloc.dart';

class PickServiceState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<DeviceServiceDtos>? deviceservicedtoss;
int? pageIndex;

  DeviceServiceDtos? deviceservicedtos;


  PickServiceState(
  {
  this.deviceservicedtoss,this.deviceservicedtos,
this.pageIndex,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        deviceservicedtoss,deviceservicedtos,
pageIndex,
msg,status,

      ];

PickServiceState copyWith({
    List<DeviceServiceDtos>? deviceservicedtoss,
int? pageIndex,

    DeviceServiceDtos? deviceservicedtos,
    
  }) {
    return PickServiceState(
      deviceservicedtoss: deviceservicedtoss ?? this.deviceservicedtoss,
 deviceservicedtos: deviceservicedtos ?? this.deviceservicedtos,
 pageIndex: pageIndex ?? this.pageIndex,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class PickServiceInitial extends PickServiceState {
  PickServiceInitial() {
    }
  }


