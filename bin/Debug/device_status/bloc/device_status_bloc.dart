
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../device_status_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/device_state.dart';
import '../../../models/step.dart';


part 'device_status_event.dart';
part 'device_status_state.dart';

class DeviceStatusBloc extends BaseBloc<DeviceStatusEvent, DeviceStatusState, DeviceStatusRepository> {
  DeviceStatusBloc(
      {required DeviceStatusRepository repository, required DeviceStatusState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<DeviceStatusChangeStepEvent>(_onChangeStep);
on<DeviceStatusClickSubmitEvent>(_onClickSubmit);
on<DeviceStatusChangeDesEvent>(_onChangeDes);

  }

 FutureOr<void> _onChangeStep(
                DeviceStatusChangeStepEvent event, Emitter<DeviceStatusState> emit) { }
FutureOr<void> _onClickSubmit(
                DeviceStatusClickSubmitEvent event, Emitter<DeviceStatusState> emit) { }
FutureOr<void> _onChangeDes(
                DeviceStatusChangeDesEvent event, Emitter<DeviceStatusState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == DeviceStatusActions.getDeviceStateFindAlls) {
        emit(state.copyWith(devicestates: event?.data));
      }
 else if (event?.action == DeviceStatusActions.getStepFindAlls) {
        emit(state.copyWith(steps: event?.data));
      }

   });
 }
}
