part of 'product_all_comment_bloc.dart';

class ProductAllCommentState extends Equatable implements BaseState{

  @override
  Status? status;

  @override
  String? msg;
  List<UserComment>? usercomments;
Product? product;

  UserComment? usercomment;


  ProductAllCommentState(
  {
  this.usercomments,this.usercomment,
this.product,
this.msg,this.status

  });

  @override
  List<Object?> get props => [
        usercomments,usercomment,
product,
msg,status,

      ];

ProductAllCommentState copyWith({
    List<UserComment>? usercomments,
Product? product,

    UserComment? usercomment,
    
  }) {
    return ProductAllCommentState(
      usercomments: usercomments ?? this.usercomments,
 usercomment: usercomment ?? this.usercomment,
 product: product ?? this.product,
msg: msg ?? this.msg,
 status: status ?? this.status,

    );
  }

}

 
class ProductAllCommentInitial extends ProductAllCommentState {
  ProductAllCommentInitial() {
    }
  }


