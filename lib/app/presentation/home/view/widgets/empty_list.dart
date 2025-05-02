import 'package:flutter/material.dart';
import 'package:seek_qr_reader/app/app_colors.dart';

Widget emptyList() => Center(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      const SizedBox(height: 80),

      Icon(Icons.assignment_late_outlined, color: AppColors.primary),
      Text(
        'Empty list',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text('Press the scanner button to add items.'),
    ],
  ),
);
