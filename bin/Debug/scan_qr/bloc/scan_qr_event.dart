
part of 'scan_qr_bloc.dart';

abstract class ScanQrEvent extends Equatable {
  const ScanQrEvent();
}

class ScanQrOnFinishScanEvent extends ScanQrEvent{
  @override
  List<Object?> get props => [];
}
class ScanQrClickShowAllDeviceEvent extends ScanQrEvent{
  @override
  List<Object?> get props => [];
}


