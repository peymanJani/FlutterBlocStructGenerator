
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/device_kind.dart';
import '../../../services/device_kind_service.dart';


class SelectDeviceKindRepository extends BaseRepository<BaseRepositoryStatus> {
  SelectDeviceKindRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getDeviceKinds()async {
     
    await serviceManager.userService.getDeviceKinds( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: SelectDeviceKindActions.getDeviceKindFindAlls , msg: msg)) :  null;
    });
  }
  getDeviceKindById(id)async {
    await serviceManager.userService.getDeviceKindById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: SelectDeviceKindActions.getDeviceKindById , msg: msg)) :  null;
    });
  }




}

class SelectDeviceKindRepositoryStatus implements BaseRepositoryStatus<SelectDeviceKindActions> {
  @override
  SelectDeviceKindActions? action;

  @override
  String? msg;

  dynamic data;

  SelectDeviceKindRepositoryStatus({this.action, this.data , this.msg});

  @override
  SelectDeviceKindRepositoryStatus copyWith({SelectDeviceKindActions? action, dynamic data , String? msg}) {
    return SelectDeviceKindRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum SelectDeviceKindActions {
  getDeviceKindFindAlls,getDeviceKindById,
}


