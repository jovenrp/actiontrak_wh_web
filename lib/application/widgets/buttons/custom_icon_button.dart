import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final String label;
  final Color textColor, iconColor;
  final double iconSize, textSize;
  final int maxLines, turn;
  final VoidCallback onTap;
  final bool isActive;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.textColor = AppColors.textColor,
    this.iconColor = AppColors.primaryAccent,
    this.iconSize = 24.0,
    this.textSize = 16.0,
    this.maxLines = 2,
    this.isActive = false,
    this.turn = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(999)),
              color: !isActive ? AppColors.disabledButton : AppColors.surface,
            ),
            child: RotatedBox(quarterTurns: turn, child: Image.asset(icon, width: iconSize,),),
            //child: Icon(icon, color: !isActive ? AppColors.disabledText : iconColor, size: iconSize),
          ),
          const SizedBox(height: 8.0), // Space between icon and text
          CustomHeader(
            text: label,
            color: !isActive ? AppColors.disabledText : textColor,
            fontSize: textSize,
            textAlign: TextAlign.center,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
