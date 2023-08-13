part of 'shop_product_bloc.dart';

class ShopProductState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<Product>? products;
bool? showLoading;

  Product? product;


  ShopProductState(
  {
  this.products,this.product,
this.showLoading,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        products,product,
showLoading,
msg,status,

      ];

ShopProductState copyWith({
    List<Product>? products,
bool? showLoading,

    Product? product,
    
  }) {
    return ShopProductState(
      products: products ?? this.products,
 product: product ?? this.product,
 showLoading: showLoading ?? this.showLoading,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class ShopProductInitial extends ShopProductState {
  ShopProductInitial() {
    }
  }


