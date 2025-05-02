import 'package:flutter/material.dart';
import 'package:seek_qr_reader/app/app_colors.dart';

Widget errorHome(String message) => Center(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      const SizedBox(height: 80),
      Icon(Icons.error_outline_outlined, color: AppColors.error),
      Text(
        'Sorry we have problems',
        style: TextStyle(
          color: AppColors.error,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text('Error: $message'),
    ],
  ),
);
