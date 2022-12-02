part of 'splash_new_bloc.dart';

class SplashNewState extends Equatable {
  List<User>? users;

  User? user;


  SplashNewState(
  {
  this.users,this.user,

  });

  @override
  List<Object?> get props => [
        users,user,

      ];

SplashNewState copyWith({
    List<User>? users,

    User? user,
    
  }) {
    return SplashNewState(
      users: users ?? this.users,
 user: user ?? this.user,

    );
  }

}

 
class SplashNewInitial extends SplashNewState {
  SplashNewInitial() {
    }
  }


