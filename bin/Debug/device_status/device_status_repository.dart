
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/device_state.dart';
import '../../../services/device_state_service.dart';
import '../../../models/step.dart';
import '../../../services/step_service.dart';


class DeviceStatusRepository extends BaseRepository<BaseRepositoryStatus> {
  DeviceStatusRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getDeviceStates()async {
     
    await serviceManager.userService.getDeviceStates( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceStatusActions.getDeviceStateFindAlls , msg: msg)) :  null;
    });
  }
  getDeviceStateById(id)async {
    await serviceManager.userService.getDeviceStateById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceStatusActions.getDeviceStateById , msg: msg)) :  null;
    });
  }




  getSteps()async {
     
    await serviceManager.userService.getSteps( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceStatusActions.getStepFindAlls , msg: msg)) :  null;
    });
  }
  getStepById(id)async {
    await serviceManager.userService.getStepById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceStatusActions.getStepById , msg: msg)) :  null;
    });
  }




}

class DeviceStatusRepositoryStatus implements BaseRepositoryStatus<DeviceStatusActions> {
  @override
  DeviceStatusActions? action;

  @override
  String? msg;

  dynamic data;

  DeviceStatusRepositoryStatus({this.action, this.data , this.msg});

  @override
  DeviceStatusRepositoryStatus copyWith({DeviceStatusActions? action, dynamic data , String? msg}) {
    return DeviceStatusRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum DeviceStatusActions {
  getDeviceStateFindAlls,getDeviceStateById,getStepFindAlls,getStepById,
}


