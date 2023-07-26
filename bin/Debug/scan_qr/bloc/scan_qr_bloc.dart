
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../scan_qr_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/devices.dart';


part 'scan_qr_event.dart';
part 'scan_qr_state.dart';

class ScanQrBloc extends BaseBloc<ScanQrEvent, ScanQrState, ScanQrRepository> {
  ScanQrBloc(
      {required ScanQrRepository repository, required ScanQrState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<ScanQrOnFinishScanEvent>(_onOnFinishScan);
on<ScanQrClickShowAllDeviceEvent>(_onClickShowAllDevice);

  }

 FutureOr<void> _onOnFinishScan(
                ScanQrOnFinishScanEvent event, Emitter<ScanQrState> emit) { }
FutureOr<void> _onClickShowAllDevice(
                ScanQrClickShowAllDeviceEvent event, Emitter<ScanQrState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == ScanQrActions.getDevicesFindAlls) {
        emit(state.copyWith(devicess: event?.data));
      }

   });
 }
}
