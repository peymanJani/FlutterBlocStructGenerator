
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../select_device_kind_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/device_kind.dart';


part 'select_device_kind_event.dart';
part 'select_device_kind_state.dart';

class SelectDeviceKindBloc extends BaseBloc<SelectDeviceKindEvent, SelectDeviceKindState, SelectDeviceKindRepository> {
  SelectDeviceKindBloc(
      {required SelectDeviceKindRepository repository, required SelectDeviceKindState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<SelectDeviceKindClickItemsEvent>(_onClickItems);
on<SelectDeviceKindClickExitAccountEvent>(_onClickExitAccount);

  }

 FutureOr<void> _onClickItems(
                SelectDeviceKindClickItemsEvent event, Emitter<SelectDeviceKindState> emit) { }
FutureOr<void> _onClickExitAccount(
                SelectDeviceKindClickExitAccountEvent event, Emitter<SelectDeviceKindState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == SelectDeviceKindActions.getDeviceKindFindAlls) {
        emit(state.copyWith(devicekinds: event?.data));
      }

   });
 }
}
