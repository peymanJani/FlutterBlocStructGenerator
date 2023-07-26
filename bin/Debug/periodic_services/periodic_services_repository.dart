
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/periodic_service_dto.dart';
import '../../../services/periodic_service_dto_service.dart';


class PeriodicServicesRepository extends BaseRepository<BaseRepositoryStatus> {
  PeriodicServicesRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getPeriodicServiceDtos()async {
     
    await serviceManager.userService.getPeriodicServiceDtos( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: PeriodicServicesActions.getPeriodicServiceDtoFindAlls , msg: msg)) :  null;
    });
  }
  getPeriodicServiceDtoById(id)async {
    await serviceManager.userService.getPeriodicServiceDtoById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: PeriodicServicesActions.getPeriodicServiceDtoById , msg: msg)) :  null;
    });
  }




}

class PeriodicServicesRepositoryStatus implements BaseRepositoryStatus<PeriodicServicesActions> {
  @override
  PeriodicServicesActions? action;

  @override
  String? msg;

  dynamic data;

  PeriodicServicesRepositoryStatus({this.action, this.data , this.msg});

  @override
  PeriodicServicesRepositoryStatus copyWith({PeriodicServicesActions? action, dynamic data , String? msg}) {
    return PeriodicServicesRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum PeriodicServicesActions {
  getPeriodicServiceDtoFindAlls,getPeriodicServiceDtoById,
}


