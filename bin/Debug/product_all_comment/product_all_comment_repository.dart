
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/user_comment.dart';
import '../../../services/user_comment_service.dart';


class ProductAllCommentRepository extends BaseRepository<BaseRepositoryStatus> {
  ProductAllCommentRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getUserComments()async {
     
    await serviceManager.userService.getUserComments( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ProductAllCommentActions.getUserCommentFindAlls , msg: msg)) :  null;
    });
  }
  getUserCommentById(id)async {
    await serviceManager.userService.getUserCommentById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ProductAllCommentActions.getUserCommentById , msg: msg)) :  null;
    });
  }




}

class ProductAllCommentRepositoryStatus implements BaseRepositoryStatus<ProductAllCommentActions> {
  @override
  ProductAllCommentActions? action;

  @override
  String? msg;

  dynamic data;

  ProductAllCommentRepositoryStatus({this.action, this.data , this.msg});

  @override
  ProductAllCommentRepositoryStatus copyWith({ProductAllCommentActions? action, dynamic data , String? msg}) {
    return ProductAllCommentRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum ProductAllCommentActions {
  getUserCommentFindAlls,getUserCommentById,
}


