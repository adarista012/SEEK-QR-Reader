import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:seek_qr_scanner/app/domain/usecases/add_scanned_qr_usecase.dart';
import 'package:seek_qr_scanner/app/domain/usecases/get_scanned_qrs_usecase.dart';

import '../bloc/bloc.dart';
import 'view.dart';

final getIt = GetIt.instance;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => HomeBloc(
            getIt<GetScannedQrsUsecase>(),
            getIt<AddScannedQrUsecase>(),
          ),
      child: const HomeView(),
    );
  }
}
