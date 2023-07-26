
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../periodic_services_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/periodic_service_dto.dart';


part 'periodic_services_event.dart';
part 'periodic_services_state.dart';

class PeriodicServicesBloc extends BaseBloc<PeriodicServicesEvent, PeriodicServicesState, PeriodicServicesRepository> {
  PeriodicServicesBloc(
      {required PeriodicServicesRepository repository, required PeriodicServicesState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<PeriodicServicesClickItemEvent>(_onClickItem);

  }

 FutureOr<void> _onClickItem(
                PeriodicServicesClickItemEvent event, Emitter<PeriodicServicesState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == PeriodicServicesActions.getPeriodicServiceDtoFindAlls) {
        emit(state.copyWith(periodicservicedtos: event?.data));
      }

   });
 }
}
