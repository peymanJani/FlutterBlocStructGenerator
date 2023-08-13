
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_details_repository.dart';
import '../bloc/product_details_bloc.dart';
import 'product_details_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class ProductDetailsPage extends StatelessWidget {
  static String getRout = 'ProductDetails';

  ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => ProductDetailsBloc(
              repository: ProductDetailsRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: ProductDetailsInitial()),
          child: ProductDetailsWidget(),
        ));
  }
}

