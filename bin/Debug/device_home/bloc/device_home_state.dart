part of 'device_home_bloc.dart';

class DeviceHomeState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<Service>? services;
List<Weather>? weathers;
List<Language>? languages;
int? pageIndex;
DeviceStatus? deviceStatus;

  Service? service;
Weather? weather;
Language? language;


  DeviceHomeState(
  {
  this.services,this.service,
this.weathers,this.weather,
this.languages,this.language,
this.pageIndex,
this.deviceStatus,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        services,service,
weathers,weather,
languages,language,
pageIndex,
deviceStatus,
msg,status,

      ];

DeviceHomeState copyWith({
    List<Service>? services,
List<Weather>? weathers,
List<Language>? languages,
int? pageIndex,
DeviceStatus? deviceStatus,

    Service? service,
Weather? weather,
Language? language,
    
  }) {
    return DeviceHomeState(
      services: services ?? this.services,
 service: service ?? this.service,
weathers: weathers ?? this.weathers,
 weather: weather ?? this.weather,
languages: languages ?? this.languages,
 language: language ?? this.language,
 pageIndex: pageIndex ?? this.pageIndex,
 deviceStatus: deviceStatus ?? this.deviceStatus,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class DeviceHomeInitial extends DeviceHomeState {
  DeviceHomeInitial() {
    }
  }


