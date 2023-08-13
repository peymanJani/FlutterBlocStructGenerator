
part of 'shop_product_bloc.dart';

abstract class ShopProductEvent extends Equatable {
  const ShopProductEvent();
}

class ShopProductClickItemProductEvent extends ShopProductEvent{
  @override
  List<Object?> get props => [];
}


