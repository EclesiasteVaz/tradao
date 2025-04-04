import 'package:flutter/material.dart';
import 'package:tradao/core/themes/app_color.dart';

class SnackBarWidget extends SnackBar {
  SnackBarWidget({super.key, required this.text})
      : super(
          content: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.backgroundColorTextFieldDark,
        );
  final String text;
}
