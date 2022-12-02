
part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashClickLoadAgainEvent extends SplashEvent{
  @override
  List<Object?> get props => [];
}
class SplashSelectLanguageTitleEvent extends SplashEvent{
  @override
  List<Object?> get props => [];
}
class SplashSelectLanguageEvent extends SplashEvent{
  @override
  List<Object?> get props => [];
}


