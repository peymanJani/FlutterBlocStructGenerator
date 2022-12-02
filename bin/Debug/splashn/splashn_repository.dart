
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/user.dart';
import '../../../services/user_service.dart';


class SplashNRepository extends BaseRepository<SplashNBaseRepositoryStatus> {
  SplashNRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
getUsers() {
     
List<User> result = await serviceManager.userService.getUsers();
       add(state?.copyWidth(data: result, action: SplashNActions.getUsers));
}
getUserById() {
    UserDto result = serviceManager.userService.getUserById(id: id);
    add(state?.copyWidth(data: result, action: splashActions.getUserFindAlls));
}




}

class SplashNRepositoryStatus implements BaseRepositoryStatus<SplashNActions> {
  @override
  SplashNActions? action;

  dynamic data;

  SplashNRepositoryStatus({this.action, this.data});

  SplashNRepositoryStatus copyWidth({SplashNActions? action, dynamic data}) {
    return SplashNRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data);
  }
}

enum SplashNActions {
  getUserFindAlls,getUserById,
}


