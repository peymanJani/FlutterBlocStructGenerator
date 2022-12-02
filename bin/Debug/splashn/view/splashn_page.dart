
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../splashn_repository.dart';
import '../bloc/splashn_bloc.dart';
import 'splashn_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class SplashNPage extends StatelessWidget {
  

  SplashNPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => SplashNBloc(
              repository: SplashNRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: SplashNInitial()),
          child: SplashNWidget(),
        ));
  }
}

