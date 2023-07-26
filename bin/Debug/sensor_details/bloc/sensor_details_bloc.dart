
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../sensor_details_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/sensor_details.dart';
import '../../../models/sensor_details_chare.dart';


part 'sensor_details_event.dart';
part 'sensor_details_state.dart';

class SensorDetailsBloc extends BaseBloc<SensorDetailsEvent, SensorDetailsState, SensorDetailsRepository> {
  SensorDetailsBloc(
      {required SensorDetailsRepository repository, required SensorDetailsState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<SensorDetailsChangeDateValueEvent>(_onChangeDateValue);
on<SensorDetailsClickGetChartByDateEvent>(_onClickGetChartByDate);

  }

 FutureOr<void> _onChangeDateValue(
                SensorDetailsChangeDateValueEvent event, Emitter<SensorDetailsState> emit) { }
FutureOr<void> _onClickGetChartByDate(
                SensorDetailsClickGetChartByDateEvent event, Emitter<SensorDetailsState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == SensorDetailsActions.getSensorDetailsFindAlls) {
        emit(state.copyWith(sensordetailss: event?.data));
      }
 else if (event?.action == SensorDetailsActions.getSensorDetailsChareFindAlls) {
        emit(state.copyWith(sensordetailschares: event?.data));
      }

   });
 }
}
