
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/service.dart';
import '../../../services/service_service.dart';
import '../../../models/weather.dart';
import '../../../services/weather_service.dart';
import '../../../models/language.dart';
import '../../../services/language_service.dart';


class DeviceHomeRepository extends BaseRepository<BaseRepositoryStatus> {
  DeviceHomeRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getServices()async {
     
    await serviceManager.userService.getServices( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceHomeActions.getServiceFindAlls , msg: msg)) :  null;
    });
  }
  getServiceById(id)async {
    await serviceManager.userService.getServiceById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceHomeActions.getServiceById , msg: msg)) :  null;
    });
  }




  getWeathers()async {
     
    await serviceManager.userService.getWeathers( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceHomeActions.getWeatherFindAlls , msg: msg)) :  null;
    });
  }
  getWeatherById(id)async {
    await serviceManager.userService.getWeatherById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceHomeActions.getWeatherById , msg: msg)) :  null;
    });
  }




  getLanguages()async {
     
    await serviceManager.userService.getLanguages( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceHomeActions.getLanguageFindAlls , msg: msg)) :  null;
    });
  }
  getLanguageById(id)async {
    await serviceManager.userService.getLanguageById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: DeviceHomeActions.getLanguageById , msg: msg)) :  null;
    });
  }




}

class DeviceHomeRepositoryStatus implements BaseRepositoryStatus<DeviceHomeActions> {
  @override
  DeviceHomeActions? action;

  @override
  String? msg;

  dynamic data;

  DeviceHomeRepositoryStatus({this.action, this.data , this.msg});

  @override
  DeviceHomeRepositoryStatus copyWith({DeviceHomeActions? action, dynamic data , String? msg}) {
    return DeviceHomeRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum DeviceHomeActions {
  getServiceFindAlls,getServiceById,getWeatherFindAlls,getWeatherById,getLanguageFindAlls,getLanguageById,
}


