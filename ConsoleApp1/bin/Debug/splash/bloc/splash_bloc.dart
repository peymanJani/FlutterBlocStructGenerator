
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../splash_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/user.dart';
import '../../../models/language.dart';
import '../../../models/language_title.dart';


part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState, SplashRepository> {
  SplashBloc(
      {required SplashRepository repository, required SplashState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<SplashClickLoadAgainEvent>(_onClickLoadAgain);
on<SplashSelectLanguageTitleEvent>(_onSelectLanguageTitle);
on<SplashSelectLanguageEvent>(_onSelectLanguage);

  }

 FutureOr<void> _onClickLoadAgain(
                SplashClickLoadAgainEvent event, Emitter<SplashState> emit) { }
FutureOr<void> _onSelectLanguageTitle(
                SplashSelectLanguageTitleEvent event, Emitter<SplashState> emit) { }
FutureOr<void> _onSelectLanguage(
                SplashSelectLanguageEvent event, Emitter<SplashState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == SplashActions.getUserFindAlls) {
        emit(state.copyWith(users: event?.data));
      }
 else if (event?.action == SplashActions.getLanguageFindAlls) {
        emit(state.copyWith(languages: event?.data));
      }
 else if (event?.action == SplashActions.getLanguageTitleFindAlls) {
        emit(state.copyWith(languagetitles: event?.data));
      }

   });
 }
}
