import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'view.dart';

class QrReaderPage extends StatelessWidget {
  const QrReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => QrReaderBloc(1), child: QrReaderView());
  }
}
