part of 'home_bloc.dart';

class HomeState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<User>? users;
List<AppSetting>? appsettings;
List<HomeItem>? homeItems;

  User? user;
AppSetting? appsetting;


  HomeState(
  {
  this.users,this.user,
this.appsettings,this.appsetting,
this.homeItems,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        users,user,
appsettings,appsetting,
homeItems,
msg,status,

      ];

HomeState copyWith({
    List<User>? users,
List<AppSetting>? appsettings,
List<HomeItem>? homeItems,

    User? user,
AppSetting? appsetting,
    
  }) {
    return HomeState(
      users: users ?? this.users,
 user: user ?? this.user,
appsettings: appsettings ?? this.appsettings,
 appsetting: appsetting ?? this.appsetting,
 homeItems: homeItems ?? this.homeItems,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class HomeInitial extends HomeState {
  HomeInitial() {
    }
  }


