
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../a_repository.dart';
import '../bloc/a_bloc.dart';
import 'a_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class APage extends StatelessWidget {
  static String getRout = 'A';

  APage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => ABloc(
              repository: ARepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: AInitial()),
          child: AWidget(),
        ));
  }
}

