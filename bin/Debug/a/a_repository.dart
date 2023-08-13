
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/b.dart';
import '../../../services/b_service.dart';


class ARepository extends BaseRepository<BaseRepositoryStatus> {
  ARepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getBs()async {
     
    await serviceManager.userService.getBs( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: AActions.getBFindAlls , msg: msg)) :  null;
    });
  }
  getBById(id)async {
    await serviceManager.userService.getBById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: AActions.getBById , msg: msg)) :  null;
    });
  }




}

class ARepositoryStatus implements BaseRepositoryStatus<AActions> {
  @override
  AActions? action;

  @override
  String? msg;

  dynamic data;

  ARepositoryStatus({this.action, this.data , this.msg});

  @override
  ARepositoryStatus copyWith({AActions? action, dynamic data , String? msg}) {
    return ARepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum AActions {
  getBFindAlls,getBById,
}


