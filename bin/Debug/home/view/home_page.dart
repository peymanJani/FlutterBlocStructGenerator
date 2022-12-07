
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_repository.dart';
import '../bloc/home_bloc.dart';
import 'home_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class HomePage extends StatelessWidget {
  static String getRout = 'Home';

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => HomeBloc(
              repository: HomeRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: HomeInitial()),
          child: HomeWidget(),
        ));
  }
}

