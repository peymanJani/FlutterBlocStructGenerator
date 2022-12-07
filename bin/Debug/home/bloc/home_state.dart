part of 'home_bloc.dart';

class HomeState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<User>? users;
int? pageIndex;

  User? user;


  HomeState(
  {
  this.users,this.user,
this.pageIndex,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        users,user,
pageIndex,
msg,status,

      ];

HomeState copyWith({
    List<User>? users,
int? pageIndex,

    User? user,
    
  }) {
    return HomeState(
      users: users ?? this.users,
 user: user ?? this.user,
pageIndexs: pageIndexs ?? this.pageIndexs,
 pageIndex: pageIndex ?? this.pageIndex,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class HomeInitial extends HomeState {
  HomeInitial() {
    }
  }


