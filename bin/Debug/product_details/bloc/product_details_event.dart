
part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
}

class ProductDetailsClickLikeEvent extends ProductDetailsEvent{
  @override
  List<Object?> get props => [];
}
class ProductDetailsClickBtnBuyEvent extends ProductDetailsEvent{
  @override
  List<Object?> get props => [];
}
class ProductDetailsClickAddCountEvent extends ProductDetailsEvent{
  @override
  List<Object?> get props => [];
}
class ProductDetailsClickMinusCountEvent extends ProductDetailsEvent{
  @override
  List<Object?> get props => [];
}
class ProductDetailsAddProductCommentEvent extends ProductDetailsEvent{
  @override
  List<Object?> get props => [];
}


