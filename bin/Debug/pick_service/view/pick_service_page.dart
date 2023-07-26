
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pick_service_repository.dart';
import '../bloc/pick_service_bloc.dart';
import 'pick_service_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class PickServicePage extends StatelessWidget {
  static String getRout = 'PickService';

  PickServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => PickServiceBloc(
              repository: PickServiceRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: PickServiceInitial()),
          child: PickServiceWidget(),
        ));
  }
}

