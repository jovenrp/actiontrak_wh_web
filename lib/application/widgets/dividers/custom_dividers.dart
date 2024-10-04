import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDividers extends StatelessWidget {
  const CustomDividers({super.key, this.color = AppColors.surface});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
    );
  }
}