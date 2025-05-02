import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_qr_reader/app/app_colors.dart';
import 'package:seek_qr_reader/app/presentation/qr_scanned_details/view/widgets/snackbar_row_details.dart';

import '../../bloc/bloc.dart';

Widget rowDataDetails(
  String title,
  String url,
  bool isUrl,
  BuildContext context,
) => Row(
  children: [
    Text(
      '$title: ',
      style: TextStyle(
        color: AppColors.primary,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    Expanded(
      child: GestureDetector(
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: url));
          ScaffoldMessenger.of(context).showSnackBar(snackBarRowDetails());
        },
        onTap:
            () => context.read<QrScannedDetailsBloc>().add(GoToUrl(url: url)),
        child: Text(
          url,
          overflow: TextOverflow.visible,
          maxLines: 1,
          style:
              isUrl
                  ? TextStyle(
                    color: AppColors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blue,
                    overflow: TextOverflow.visible,
                  )
                  : null,
        ),
      ),
    ),
  ],
);
