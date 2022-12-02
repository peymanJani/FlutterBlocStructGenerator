
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../splash_repository.dart';
import '../bloc/splash_bloc.dart';
import 'splash_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class SplashPage extends StatelessWidget {
  static String getRout = 'Splash';

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => SplashBloc(
              repository: SplashRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: SplashInitial()),
          child: SplashWidget(),
        ));
  }
}

