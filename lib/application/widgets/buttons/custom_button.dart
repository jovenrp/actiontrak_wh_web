// ignore_for_file: unused_import

import 'package:actiontrak_wh/application/widgets/texts/custom_button_text.dart';
import 'package:flutter/material.dart';
import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';

import '../texts/custom_text.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double elevation, width;
  final bool isSecondaryButton;

  const CustomButton({super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primary,
    this.textColor = AppColors.textColor,
    this.elevation = 2.0,
    this.width = double.infinity,
    this.isSecondaryButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSecondaryButton ? AppColors.surface : color,
          foregroundColor: isSecondaryButton ? AppColors.primary : textColor,
        ),
        onPressed: onPressed,
        child: CustomButtonText(text: text, isSecondary: isSecondaryButton,),
      ),
    );
  }
}
