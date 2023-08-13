part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<Product>? products;
List<UserComment>? usercomments;
int? pageIndex;

  Product? product;
UserComment? usercomment;


  ProductDetailsState(
  {
  this.products,this.product,
this.usercomments,this.usercomment,
this.pageIndex,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        products,product,
usercomments,usercomment,
pageIndex,
msg,status,

      ];

ProductDetailsState copyWith({
    List<Product>? products,
List<UserComment>? usercomments,
int? pageIndex,

    Product? product,
UserComment? usercomment,
    
  }) {
    return ProductDetailsState(
      products: products ?? this.products,
 product: product ?? this.product,
usercomments: usercomments ?? this.usercomments,
 usercomment: usercomment ?? this.usercomment,
 pageIndex: pageIndex ?? this.pageIndex,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class ProductDetailsInitial extends ProductDetailsState {
  ProductDetailsInitial() {
    }
  }


