import 'package:flutter/material.dart';
import 'package:seek_qr_scanner/app/app_colors.dart';
import 'package:seek_qr_scanner/app/app_navigation.dart';
import 'package:seek_qr_scanner/app/domain/entities/qr.dart';

Widget cardQrReaded(
  String title,
  String message,
  DateTime date,
  BuildContext context,
) => MaterialButton(
  onPressed:
      () async => await Navigator.pushNamed(
        context,
        Routes.QR_SCANNED_DETAILS, //
        arguments: Qr(data: title, date: date),
      ),
  padding: EdgeInsets.zero,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  color: AppColors.primary.withAlpha(222),
  child: ListTile(
    title: Text(
      title,
      style: TextStyle(color: AppColors.inverse, fontWeight: FontWeight.w600),
    ),
    subtitle: Text(
      date.toLocal().toString(),
      style: TextStyle(color: AppColors.inverse, fontWeight: FontWeight.w300),
    ),
  ),
);
