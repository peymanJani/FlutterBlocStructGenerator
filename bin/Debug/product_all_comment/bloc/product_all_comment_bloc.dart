
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../base_class/base_state.dart';

import '../product_all_comment_repository.dart';
import '../../../base_class/base_bloc.dart';
import '../../../base_class/base_repository.dart';

import '../../../models/user_comment.dart';


part 'product_all_comment_event.dart';
part 'product_all_comment_state.dart';

class ProductAllCommentBloc extends BaseBloc<ProductAllCommentEvent, ProductAllCommentState, ProductAllCommentRepository> {
  ProductAllCommentBloc(
      {required ProductAllCommentRepository repository, required ProductAllCommentState initialState})
      : super(repository: repository, initialState: initialState) {
   

    on<ProductAllCommentClickReportItemEvent>(_onClickReportItem);
on<ProductAllCommentClickEditOwnItemEvent>(_onClickEditOwnItem);
on<ProductAllCommentClickDeleteOwnItemEvent>(_onClickDeleteOwnItem);

  }

 FutureOr<void> _onClickReportItem(
                ProductAllCommentClickReportItemEvent event, Emitter<ProductAllCommentState> emit) { }
FutureOr<void> _onClickEditOwnItem(
                ProductAllCommentClickEditOwnItemEvent event, Emitter<ProductAllCommentState> emit) { }
FutureOr<void> _onClickDeleteOwnItem(
                ProductAllCommentClickDeleteOwnItemEvent event, Emitter<ProductAllCommentState> emit) { }

 @override
  setRepositoryListener() {
   repository.status.listen((BaseRepositoryStatus? event) {
      if (event?.action == ProductAllCommentActions.getUserCommentFindAlls) {
        emit(state.copyWith(usercomments: event?.data));
      }

   });
 }
}
