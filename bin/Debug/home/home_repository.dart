
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/user.dart';
import '../../../services/user_service.dart';


class HomeRepository extends BaseRepository<BaseRepositoryStatus> {
  HomeRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getUsers()async {
     
    await serviceManager.userService.getUsers( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWidth(data: result, action: HomeActions.getUserFindAlls , msg: msg)) :  null;
    });
  }
  getUserById(id)async {
    await serviceManager.userService.getUserById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWidth(data: result, action: HomeActions.getUserById , msg: msg)) :  null;
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

  HomeRepositoryStatus copyWidth({HomeActions? action, dynamic data , String? msg}) {
    return HomeRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum HomeActions {
  getUserFindAlls,getUserById,
}


