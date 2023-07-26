
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../device_status_repository.dart';
import '../bloc/device_status_bloc.dart';
import 'device_status_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class DeviceStatusPage extends StatelessWidget {
  static String getRout = 'DeviceStatus';

  DeviceStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => DeviceStatusBloc(
              repository: DeviceStatusRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: DeviceStatusInitial()),
          child: DeviceStatusWidget(),
        ));
  }
}

