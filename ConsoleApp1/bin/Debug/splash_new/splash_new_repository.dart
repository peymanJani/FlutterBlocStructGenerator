
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/user.dart';
import '../../../services/user_service.dart';


class SplashNewRepository extends BaseRepository<BaseRepositoryStatus> {
  SplashNewRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
getUsers()async {
     
List<User> result = await serviceManager.userService.getUsers();
       add(state?.copyWidth(data: result, action: SplashNewActions.getUserFindAlls));
}
getUserById(id)async {
    User result = serviceManager.userService.getUserById(id: id);
    add(state?.copyWidth(data: result, action: SplashNewActions.getUserById));
}




}

class SplashNewRepositoryStatus implements BaseRepositoryStatus<SplashNewActions> {
  @override
  SplashNewActions? action;

  dynamic data;

  SplashNewRepositoryStatus({this.action, this.data});

  SplashNewRepositoryStatus copyWidth({SplashNewActions? action, dynamic data}) {
    return SplashNewRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data);
  }
}

enum SplashNewActions {
  getUserFindAlls,getUserById,
}


