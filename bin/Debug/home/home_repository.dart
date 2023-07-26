
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/user.dart';
import '../../../services/user_service.dart';
import '../../../models/app_setting.dart';
import '../../../services/app_setting_service.dart';


class HomeRepository extends BaseRepository<BaseRepositoryStatus> {
  HomeRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getUsers()async {
     
    await serviceManager.userService.getUsers( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: HomeActions.getUserFindAlls , msg: msg)) :  null;
    });
  }
  getUserById(id)async {
    await serviceManager.userService.getUserById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: HomeActions.getUserById , msg: msg)) :  null;
    });
  }




  getAppSettings()async {
     
    await serviceManager.userService.getAppSettings( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: HomeActions.getAppSettingFindAlls , msg: msg)) :  null;
    });
  }
  getAppSettingById(id)async {
    await serviceManager.userService.getAppSettingById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: HomeActions.getAppSettingById , msg: msg)) :  null;
    });
  }




}

class HomeRepositoryStatus implements BaseRepositoryStatus<HomeActions> {
  @override
  HomeActions? action;

  @override
  String? msg;

  dynamic data;

  HomeRepositoryStatus({this.action, this.data , this.msg});

  @override
  HomeRepositoryStatus copyWith({HomeActions? action, dynamic data , String? msg}) {
    return HomeRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum HomeActions {
  getUserFindAlls,getUserById,getAppSettingFindAlls,getAppSettingById,
}


