
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shop_product_repository.dart';
import '../bloc/shop_product_bloc.dart';
import 'shop_product_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class ShopProductPage extends StatelessWidget {
  static String getRout = 'ShopProduct';

  ShopProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => ShopProductBloc(
              repository: ShopProductRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: ShopProductInitial()),
          child: ShopProductWidget(),
        ));
  }
}

