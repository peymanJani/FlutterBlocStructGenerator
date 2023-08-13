
part of 'product_all_comment_bloc.dart';

abstract class ProductAllCommentEvent extends Equatable {
  const ProductAllCommentEvent();
}

class ProductAllCommentClickReportItemEvent extends ProductAllCommentEvent{
  @override
  List<Object?> get props => [];
}
class ProductAllCommentClickEditOwnItemEvent extends ProductAllCommentEvent{
  @override
  List<Object?> get props => [];
}
class ProductAllCommentClickDeleteOwnItemEvent extends ProductAllCommentEvent{
  @override
  List<Object?> get props => [];
}


