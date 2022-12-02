
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../splash_new_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/user.dart';


part 'splash_new_event.dart';
part 'splash_new_state.dart';

class SplashNewBloc extends BaseBloc<SplashNewEvent, SplashNewState, SplashNewRepository> {
  SplashNewBloc(
      {required SplashNewRepository repository, required SplashNewState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<SplashNewClickItemEvent>(_onClickItem);

  }

 FutureOr<void> _onClickItem(
                SplashNewClickItemEvent event, Emitter<SplashNewState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((event) {
      var status = event as BaseRepositoryStatus?;
      if (status?.action == SplashNewActions.getUserFindAlls) {
        emit(state.copyWith(users: status?.data));
      }

   });
 }
}
