import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'view.dart';

class QrScannedDetailsPage extends StatelessWidget {
  const QrScannedDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QrScannedDetailsBloc(),
      child: const QrScannedDetailsView(),
    );
  }
}
