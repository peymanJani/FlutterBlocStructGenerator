
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../device_home_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/service.dart';
import '../../../models/weather.dart';
import '../../../models/language.dart';


part 'device_home_event.dart';
part 'device_home_state.dart';

class DeviceHomeBloc extends BaseBloc<DeviceHomeEvent, DeviceHomeState, DeviceHomeRepository> {
  DeviceHomeBloc(
      {required DeviceHomeRepository repository, required DeviceHomeState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<DeviceHomeClickTabBarEvent>(_onClickTabBar);
on<DeviceHomeClickFullScreenMapEvent>(_onClickFullScreenMap);
on<DeviceHomeClickAddServiceEvent>(_onClickAddService);
on<DeviceHomeClickExitAccountEvent>(_onClickExitAccount);
on<DeviceHomeClickChangeLanguageEvent>(_onClickChangeLanguage);
on<DeviceHomeClickSelectDeviceEvent>(_onClickSelectDevice);

  }

 FutureOr<void> _onClickTabBar(
                DeviceHomeClickTabBarEvent event, Emitter<DeviceHomeState> emit) { }
FutureOr<void> _onClickFullScreenMap(
                DeviceHomeClickFullScreenMapEvent event, Emitter<DeviceHomeState> emit) { }
FutureOr<void> _onClickAddService(
                DeviceHomeClickAddServiceEvent event, Emitter<DeviceHomeState> emit) { }
FutureOr<void> _onClickExitAccount(
                DeviceHomeClickExitAccountEvent event, Emitter<DeviceHomeState> emit) { }
FutureOr<void> _onClickChangeLanguage(
                DeviceHomeClickChangeLanguageEvent event, Emitter<DeviceHomeState> emit) { }
FutureOr<void> _onClickSelectDevice(
                DeviceHomeClickSelectDeviceEvent event, Emitter<DeviceHomeState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == DeviceHomeActions.getServiceFindAlls) {
        emit(state.copyWith(services: event?.data));
      }
 else if (event?.action == DeviceHomeActions.getWeatherFindAlls) {
        emit(state.copyWith(weathers: event?.data));
      }
 else if (event?.action == DeviceHomeActions.getLanguageFindAlls) {
        emit(state.copyWith(languages: event?.data));
      }

   });
 }
}
