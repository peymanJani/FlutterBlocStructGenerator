part of 'splashn_bloc.dart';

class SplashNState extends Equatable {
  List<User>? users;

  User? user;


  SplashNState(
  {
  this.users,this.user,

  });

  @override
  List<Object?> get props => [
        users,user,

      ];

SplashNState copyWith({
    List<User>? users,

    User? user,
    
  }) {
    return SplashNState(
      users: users ?? this.users,
 user: user ?? this.user,

    );
  }

}

 
class SplashNInitial extends SplashNState {
  SplashNInitial() {
    }
  }


