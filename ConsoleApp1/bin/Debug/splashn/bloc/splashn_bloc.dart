
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../splashn_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/user.dart';


part 'splashn_event.dart';
part 'splashn_state.dart';

class SplashNBloc extends BaseBloc<SplashNEvent, SplashNState, SplashNRepository> {
  SplashNBloc(
      {required SplashNRepository repository, required SplashNState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<SplashNEventBtnEvent>(_onEventBtn);

  }

 FutureOr<void> _onEventBtn(
                SplashNEventBtnEvent event, Emitter<SplashNState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == SplashNActions.getUserFindAlls) {
        emit(state.copyWith(users: event?.data));
      }

   });
 }
}
