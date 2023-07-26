
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/devices.dart';
import '../../../services/devices_service.dart';


class ScanQrRepository extends BaseRepository<BaseRepositoryStatus> {
  ScanQrRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getDevicess()async {
     
    await serviceManager.userService.getDevicess( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ScanQrActions.getDevicesFindAlls , msg: msg)) :  null;
    });
  }
  getDevicesById(id)async {
    await serviceManager.userService.getDevicesById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ScanQrActions.getDevicesById , msg: msg)) :  null;
    });
  }




}

class ScanQrRepositoryStatus implements BaseRepositoryStatus<ScanQrActions> {
  @override
  ScanQrActions? action;

  @override
  String? msg;

  dynamic data;

  ScanQrRepositoryStatus({this.action, this.data , this.msg});

  @override
  ScanQrRepositoryStatus copyWith({ScanQrActions? action, dynamic data , String? msg}) {
    return ScanQrRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum ScanQrActions {
  getDevicesFindAlls,getDevicesById,
}


