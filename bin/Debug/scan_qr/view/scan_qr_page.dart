
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../scan_qr_repository.dart';
import '../bloc/scan_qr_bloc.dart';
import 'scan_qr_widget.dart';
import '../../../constants/colors.dart';
import '../../../services/service_manager.dart';



class ScanQrPage extends StatelessWidget {
  static String getRout = 'ScanQr';

  ScanQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (_) => ScanQrBloc(
              repository: ScanQrRepository(
                 serviceManager: context.read<ServiceManager>()),
              initialState: ScanQrInitial()),
          child: ScanQrWidget(),
        ));
  }
}

