import 'package:flutter/material.dart';
import 'package:seek_qr_scanner/app/app_colors.dart';

Widget cardQrReaded(
  String title,
  String message,
  DateTime date,
) => MaterialButton(
  onPressed: () {},
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
