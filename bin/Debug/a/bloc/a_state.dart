part of 'a_bloc.dart';

class AState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? nextPageRout;

  @override
  String? msg;
  List<B>? bs;
L? k;

  B? b;


  AState(
  {
  this.bs,this.b,
this.k,
this.msg,this.status,this.nextPageRout

  });

  @override
  List<Object?> get props => [
        bs,b,
k,
msg,status,nextPageRout

      ];

AState copyWith({
    List<B>? bs,
L? k,

    B? b,
    
  }) {
    return AState(
      bs: bs ?? this.bs,
 b: b ?? this.b,
 k: k ?? this.k,
msg: msg ?? this.msg,
 status: status ?? this.status, nextPageRout: nextPageRout ?? this.nextPageRout,

    );
  }

}

 
class AInitial extends AState {
  AInitial() {
    }
  }


