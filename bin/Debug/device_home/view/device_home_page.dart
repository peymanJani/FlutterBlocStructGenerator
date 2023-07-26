
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../device_home_repository.dart';
import '../bloc/device_home_bloc.dart';
import 'device_home_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class DeviceHomePage extends StatelessWidget {
  static String getRout = 'DeviceHome';

  DeviceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => DeviceHomeBloc(
              repository: DeviceHomeRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: DeviceHomeInitial()),
          child: DeviceHomeWidget(),
        ));
  }
}

