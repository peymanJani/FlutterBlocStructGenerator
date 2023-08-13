
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_all_comment_repository.dart';
import '../bloc/product_all_comment_bloc.dart';
import 'product_all_comment_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class ProductAllCommentPage extends StatelessWidget {
  static String getRout = 'ProductAllComment';

  ProductAllCommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => ProductAllCommentBloc(
              repository: ProductAllCommentRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: ProductAllCommentInitial()),
          child: ProductAllCommentWidget(),
        ));
  }
}

