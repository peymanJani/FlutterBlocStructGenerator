
import '../../network/Apis.dart' as apis;
import '../../network/api_service.dart';
import '../../base_class/base_repository.dart';
import '../../../services/service_manager.dart';

import '../../../models/product.dart';
import '../../../services/product_service.dart';


class ShopProductRepository extends BaseRepository<BaseRepositoryStatus> {
  ShopProductRepository({required ServiceManager serviceManager})
      : super(
            state: BaseRepositoryStatus(), serviceManager: serviceManager);

    
  getProducts()async {
     
    await serviceManager.userService.getProducts( res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ShopProductActions.getProductFindAlls , msg: msg)) :  null;
    });
  }
  getProductById(id)async {
    await serviceManager.userService.getProductById(id: id ,  res: ({isSuccess, msg, result}) {
        isSuccess! ? add(state?.copyWith(data: result, action: ShopProductActions.getProductById , msg: msg)) :  null;
    });
  }




}

class ShopProductRepositoryStatus implements BaseRepositoryStatus<ShopProductActions> {
  @override
  ShopProductActions? action;

  @override
  String? msg;

  dynamic data;

  ShopProductRepositoryStatus({this.action, this.data , this.msg});

  @override
  ShopProductRepositoryStatus copyWith({ShopProductActions? action, dynamic data , String? msg}) {
    return ShopProductRepositoryStatus(
        action: action ?? this.action, data: data ?? this.data , msg: msg);
  }
}

enum ShopProductActions {
  getProductFindAlls,getProductById,
}


