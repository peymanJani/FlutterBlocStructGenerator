part of 'scan_qr_bloc.dart';

class ScanQrState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<Devices>? devicess;
bool? onChange;

  Devices? devices;


  ScanQrState(
  {
  this.devicess,this.devices,
this.onChange,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        devicess,devices,
onChange,
msg,status,

      ];

ScanQrState copyWith({
    List<Devices>? devicess,
bool? onChange,

    Devices? devices,
    
  }) {
    return ScanQrState(
      devicess: devicess ?? this.devicess,
 devices: devices ?? this.devices,
 onChange: onChange ?? this.onChange,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class ScanQrInitial extends ScanQrState {
  ScanQrInitial() {
    }
  }


