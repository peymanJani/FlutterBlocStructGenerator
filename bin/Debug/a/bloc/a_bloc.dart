
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../base_class/base_state.dart';

import '../a_repository.dart';
import '../../../../base_class/base_bloc.dart';
import '../../../../base_class/base_repository.dart';

import '../../../../models/b.dart';


part 'a_event.dart';
part 'a_state.dart';

class ABloc extends BaseBloc<AEvent, AState, ARepository> {
  ABloc(
      {required ARepository repository, required AState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<ACEvent>(_onC);

  }

 FutureOr<void> _onC(
                ACEvent event, Emitter<AState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == AActions.getBFindAlls) {
        emit(state.copyWith(bs: event?.data));
      }

   });
 }
}
