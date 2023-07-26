
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../pick_service_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/device_service_dtos.dart';


part 'pick_service_event.dart';
part 'pick_service_state.dart';

class PickServiceBloc extends BaseBloc<PickServiceEvent, PickServiceState, PickServiceRepository> {
  PickServiceBloc(
      {required PickServiceRepository repository, required PickServiceState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<PickServiceClickTabsEvent>(_onClickTabs);
on<PickServiceClickItemsEvent>(_onClickItems);
on<PickServiceClickBackEvent>(_onClickBack);

  }

 FutureOr<void> _onClickTabs(
                PickServiceClickTabsEvent event, Emitter<PickServiceState> emit) { }
FutureOr<void> _onClickItems(
                PickServiceClickItemsEvent event, Emitter<PickServiceState> emit) { }
FutureOr<void> _onClickBack(
                PickServiceClickBackEvent event, Emitter<PickServiceState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == PickServiceActions.getDeviceServiceDtosFindAlls) {
        emit(state.copyWith(deviceservicedtoss: event?.data));
      }

   });
 }
}
