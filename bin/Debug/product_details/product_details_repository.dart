
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/product.dart';
import '../../../services/product_service.dart';
import '../../../models/user_comment.dart';
import '../../../services/user_comment_service.dart';


class ProductDetailsRepository extends BaseRepository<BaseRepositoryStatus> {
  ProductDetailsRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getProducts()async {
     
    await serviceManager.userService.getProducts( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ProductDetailsActions.getProductFindAlls , msg: msg)) :  null;
    });
  }
  getProductById(id)async {
    await serviceManager.userService.getProductById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ProductDetailsActions.getProductById , msg: msg)) :  null;
    });
  }




  getUserComments()async {
     
    await serviceManager.userService.getUserComments( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ProductDetailsActions.getUserCommentFindAlls , msg: msg)) :  null;
    });
  }
  getUserCommentById(id)async {
    await serviceManager.userService.getUserCommentById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ProductDetailsActions.getUserCommentById , msg: msg)) :  null;
    });
  }




}

class ProductDetailsRepositoryStatus implements BaseRepositoryStatus<ProductDetailsActions> {
  @override
  ProductDetailsActions? action;

  @override
  String? msg;

  dynamic data;

  ProductDetailsRepositoryStatus({this.action, this.data , this.msg});

  @override
  ProductDetailsRepositoryStatus copyWith({ProductDetailsActions? action, dynamic data , String? msg}) {
    return ProductDetailsRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum ProductDetailsActions {
  getProductFindAlls,getProductById,getUserCommentFindAlls,getUserCommentById,
}


