
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../home_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/user.dart';
import '../../../models/app_setting.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState, HomeRepository> {
  HomeBloc(
      {required HomeRepository repository, required HomeState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<HomeClickItemsEvent>(_onClickItems);
on<HomeClickProfileEvent>(_onClickProfile);

  }

 FutureOr<void> _onClickItems(
                HomeClickItemsEvent event, Emitter<HomeState> emit) { }
FutureOr<void> _onClickProfile(
                HomeClickProfileEvent event, Emitter<HomeState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == HomeActions.getUserFindAlls) {
        emit(state.copyWith(users: event?.data));
      }
 else if (event?.action == HomeActions.getAppSettingFindAlls) {
        emit(state.copyWith(appsettings: event?.data));
      }

   });
 }
}
