
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/sensor_details.dart';
import '../../../services/sensor_details_service.dart';
import '../../../models/sensor_details_chare.dart';
import '../../../services/sensor_details_chare_service.dart';


class SensorDetailsRepository extends BaseRepository<BaseRepositoryStatus> {
  SensorDetailsRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getSensorDetailss()async {
     
    await serviceManager.userService.getSensorDetailss( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: SensorDetailsActions.getSensorDetailsFindAlls , msg: msg)) :  null;
    });
  }
  getSensorDetailsById(id)async {
    await serviceManager.userService.getSensorDetailsById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: SensorDetailsActions.getSensorDetailsById , msg: msg)) :  null;
    });
  }




  getSensorDetailsChares()async {
     
    await serviceManager.userService.getSensorDetailsChares( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: SensorDetailsActions.getSensorDetailsChareFindAlls , msg: msg)) :  null;
    });
  }
  getSensorDetailsChareById(id)async {
    await serviceManager.userService.getSensorDetailsChareById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: SensorDetailsActions.getSensorDetailsChareById , msg: msg)) :  null;
    });
  }




}

class SensorDetailsRepositoryStatus implements BaseRepositoryStatus<SensorDetailsActions> {
  @override
  SensorDetailsActions? action;

  @override
  String? msg;

  dynamic data;

  SensorDetailsRepositoryStatus({this.action, this.data , this.msg});

  @override
  SensorDetailsRepositoryStatus copyWith({SensorDetailsActions? action, dynamic data , String? msg}) {
    return SensorDetailsRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum SensorDetailsActions {
  getSensorDetailsFindAlls,getSensorDetailsById,getSensorDetailsChareFindAlls,getSensorDetailsChareById,
}


