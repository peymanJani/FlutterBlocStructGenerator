
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../periodic_services_repository.dart';
import '../bloc/periodic_services_bloc.dart';
import 'periodic_services_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class PeriodicServicesPage extends StatelessWidget {
  static String getRout = 'PeriodicServices';

  PeriodicServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => PeriodicServicesBloc(
              repository: PeriodicServicesRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: PeriodicServicesInitial()),
          child: PeriodicServicesWidget(),
        ));
  }
}

