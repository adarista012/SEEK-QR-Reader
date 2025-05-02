import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'view.dart';

class CodeAuthenticationPage extends StatelessWidget {
  const CodeAuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CodeAuthenticationBloc(),
      child: const CodeAutheticationView(),
    );
  }
}
