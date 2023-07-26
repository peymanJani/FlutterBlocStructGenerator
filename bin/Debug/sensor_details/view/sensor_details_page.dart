
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../sensor_details_repository.dart';
import '../bloc/sensor_details_bloc.dart';
import 'sensor_details_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class SensorDetailsPage extends StatelessWidget {
  static String getRout = 'SensorDetails';

  SensorDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => SensorDetailsBloc(
              repository: SensorDetailsRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: SensorDetailsInitial()),
          child: SensorDetailsWidget(),
        ));
  }
}

