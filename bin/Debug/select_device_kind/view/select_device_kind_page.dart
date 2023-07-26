
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../select_device_kind_repository.dart';
import '../bloc/select_device_kind_bloc.dart';
import 'select_device_kind_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class SelectDeviceKindPage extends StatelessWidget {
  static String getRout = 'SelectDeviceKind';

  SelectDeviceKindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => SelectDeviceKindBloc(
              repository: SelectDeviceKindRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: SelectDeviceKindInitial()),
          child: SelectDeviceKindWidget(),
        ));
  }
}

