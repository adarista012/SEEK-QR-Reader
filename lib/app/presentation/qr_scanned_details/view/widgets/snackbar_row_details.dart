import 'package:flutter/material.dart';

SnackBar snackBarRowDetails() => SnackBar(
  content: const Text('Text copied!'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {},
    //
  ),
);
