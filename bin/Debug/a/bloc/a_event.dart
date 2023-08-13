
part of 'a_bloc.dart';

abstract class AEvent extends Equatable {
  const AEvent();
}

class ACEvent extends AEvent{
  @override
  List<Object?> get props => [];
}


