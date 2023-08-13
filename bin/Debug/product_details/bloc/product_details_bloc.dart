
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../product_details_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/product.dart';
import '../../../models/user_comment.dart';


part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends BaseBloc<ProductDetailsEvent, ProductDetailsState, ProductDetailsRepository> {
  ProductDetailsBloc(
      {required ProductDetailsRepository repository, required ProductDetailsState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<ProductDetailsClickLikeEvent>(_onClickLike);
on<ProductDetailsClickBtnBuyEvent>(_onClickBtnBuy);
on<ProductDetailsClickAddCountEvent>(_onClickAddCount);
on<ProductDetailsClickMinusCountEvent>(_onClickMinusCount);
on<ProductDetailsAddProductCommentEvent>(_onAddProductComment);

  }

 FutureOr<void> _onClickLike(
                ProductDetailsClickLikeEvent event, Emitter<ProductDetailsState> emit) { }
FutureOr<void> _onClickBtnBuy(
                ProductDetailsClickBtnBuyEvent event, Emitter<ProductDetailsState> emit) { }
FutureOr<void> _onClickAddCount(
                ProductDetailsClickAddCountEvent event, Emitter<ProductDetailsState> emit) { }
FutureOr<void> _onClickMinusCount(
                ProductDetailsClickMinusCountEvent event, Emitter<ProductDetailsState> emit) { }
FutureOr<void> _onAddProductComment(
                ProductDetailsAddProductCommentEvent event, Emitter<ProductDetailsState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == ProductDetailsActions.getProductFindAlls) {
        emit(state.copyWith(products: event?.data));
      }
 else if (event?.action == ProductDetailsActions.getUserCommentFindAlls) {
        emit(state.copyWith(usercomments: event?.data));
      }

   });
 }
}
