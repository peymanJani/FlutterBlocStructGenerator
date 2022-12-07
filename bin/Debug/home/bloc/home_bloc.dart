
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../home_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/user.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState, HomeRepository> {
  HomeBloc(
      {required HomeRepository repository, required HomeState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<HomeClickBottomTabEvent>(_onClickBottomTab);
on<HomeClickFloatBtnEvent>(_onClickFloatBtn);

  }

 FutureOr<void> _onClickBottomTab(
                HomeClickBottomTabEvent event, Emitter<HomeState> emit) { }
FutureOr<void> _onClickFloatBtn(
                HomeClickFloatBtnEvent event, Emitter<HomeState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == HomeActions.getUserFindAlls) {
        emit(state.copyWith(users: event?.data));
      }

   });
 }
}
