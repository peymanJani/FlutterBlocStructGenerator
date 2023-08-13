
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../shop_product_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/product.dart';


part 'shop_product_event.dart';
part 'shop_product_state.dart';

class ShopProductBloc extends BaseBloc<ShopProductEvent, ShopProductState, ShopProductRepository> {
  ShopProductBloc(
      {required ShopProductRepository repository, required ShopProductState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<ShopProductClickItemProductEvent>(_onClickItemProduct);

  }

 FutureOr<void> _onClickItemProduct(
                ShopProductClickItemProductEvent event, Emitter<ShopProductState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == ShopProductActions.getProductFindAlls) {
        emit(state.copyWith(products: event?.data));
      }

   });
 }
}
