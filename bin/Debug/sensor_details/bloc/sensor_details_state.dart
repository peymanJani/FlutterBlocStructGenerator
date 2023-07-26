part of 'sensor_details_bloc.dart';

class SensorDetailsState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<SensorDetails>? sensordetailss;
List<SensorDetailsChare>? sensordetailschares;
bool? isConnect;

  SensorDetails? sensordetails;
SensorDetailsChare? sensordetailschare;


  SensorDetailsState(
  {
  this.sensordetailss,this.sensordetails,
this.sensordetailschares,this.sensordetailschare,
this.isConnect,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        sensordetailss,sensordetails,
sensordetailschares,sensordetailschare,
isConnect,
msg,status,

      ];

SensorDetailsState copyWith({
    List<SensorDetails>? sensordetailss,
List<SensorDetailsChare>? sensordetailschares,
bool? isConnect,

    SensorDetails? sensordetails,
SensorDetailsChare? sensordetailschare,
    
  }) {
    return SensorDetailsState(
      sensordetailss: sensordetailss ?? this.sensordetailss,
 sensordetails: sensordetails ?? this.sensordetails,
sensordetailschares: sensordetailschares ?? this.sensordetailschares,
 sensordetailschare: sensordetailschare ?? this.sensordetailschare,
 isConnect: isConnect ?? this.isConnect,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class SensorDetailsInitial extends SensorDetailsState {
  SensorDetailsInitial() {
    }
  }


