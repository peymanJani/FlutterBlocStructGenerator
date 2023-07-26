
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/device_service_dtos.dart';
import '../../../services/device_service_dtos_service.dart';


class PickServiceRepository extends BaseRepository<BaseRepositoryStatus> {
  PickServiceRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getDeviceServiceDtoss()async {
     
    await serviceManager.userService.getDeviceServiceDtoss( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: PickServiceActions.getDeviceServiceDtosFindAlls , msg: msg)) :  null;
    });
  }
  getDeviceServiceDtosById(id)async {
    await serviceManager.userService.getDeviceServiceDtosById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: PickServiceActions.getDeviceServiceDtosById , msg: msg)) :  null;
    });
  }




}

class PickServiceRepositoryStatus implements BaseRepositoryStatus<PickServiceActions> {
  @override
  PickServiceActions? action;

  @override
  String? msg;

  dynamic data;

  PickServiceRepositoryStatus({this.action, this.data , this.msg});

  @override
  PickServiceRepositoryStatus copyWith({PickServiceActions? action, dynamic data , String? msg}) {
    return PickServiceRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum PickServiceActions {
  getDeviceServiceDtosFindAlls,getDeviceServiceDtosById,
}


