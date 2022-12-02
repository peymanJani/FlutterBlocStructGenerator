
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../splash_new_repository.dart';
import '../bloc/splash_new_bloc.dart';
import 'splash_new_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class SplashNewPage extends StatelessWidget {
  

  SplashNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => SplashNewBloc(
              repository: SplashNewRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: SplashNewInitial()),
          child: SplashNewWidget(),
        ));
  }
}

