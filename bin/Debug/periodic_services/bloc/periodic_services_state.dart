part of 'periodic_services_bloc.dart';

class PeriodicServicesState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<PeriodicServiceDto>? periodicservicedtos;
bool? isConnect;

  PeriodicServiceDto? periodicservicedto;


  PeriodicServicesState(
  {
  this.periodicservicedtos,this.periodicservicedto,
this.isConnect,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        periodicservicedtos,periodicservicedto,
isConnect,
msg,status,

      ];

PeriodicServicesState copyWith({
    List<PeriodicServiceDto>? periodicservicedtos,
bool? isConnect,

    PeriodicServiceDto? periodicservicedto,
    
  }) {
    return PeriodicServicesState(
      periodicservicedtos: periodicservicedtos ?? this.periodicservicedtos,
 periodicservicedto: periodicservicedto ?? this.periodicservicedto,
 isConnect: isConnect ?? this.isConnect,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class PeriodicServicesInitial extends PeriodicServicesState {
  PeriodicServicesInitial() {
    }
  }


