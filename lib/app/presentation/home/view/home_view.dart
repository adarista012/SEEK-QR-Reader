import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seek_qr_scanner/app/app_colors.dart';
import 'package:seek_qr_scanner/app/app_navigation.dart';

import 'package:seek_qr_scanner/app/presentation/home/view/widgets/card_qr_readed.dart';
import 'package:seek_qr_scanner/app/presentation/home/view/widgets/empty_list.dart';
import 'package:seek_qr_scanner/app/presentation/home/view/widgets/error_home.dart';

import '../bloc/bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetScannedQrs());

    return Scaffold(
      appBar: AppBar(title: Text('SEEK QR'), forceMaterialTransparency: true),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is ScannedQrsLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            if (state is HomeError) {
              return Center(child: errorHome(state.message));
            }

            if (state is ScannedQrsLoaded) {
              return state.scannedQrs.isEmpty
                  ? emptyList()
                  : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 8,
                        children: List<Widget>.generate(
                          state.scannedQrs.length,
                          (i) => cardQrReaded(
                            state.scannedQrs[i].data,
                            'Sender $i',
                            state.scannedQrs[i].date,
                          ),
                        ),
                      ),
                    ),
                  );
            }

            return emptyList();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, Routes.QR_READER);
        },
        backgroundColor: AppColors.inverse,
        child: Icon(Icons.qr_code_scanner_outlined),
      ),
    );
  }
}
