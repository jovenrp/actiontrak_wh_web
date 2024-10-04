import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class CustomSlideButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color sliderColor;
  final Future<bool?> Function() onSlide;

  const CustomSlideButton({
    super.key,
    required this.text,
    required this.onSlide,
    this.icon = Icons.arrow_forward_ios, // Default icon for slider
    this.backgroundColor = AppColors.primaryContrast,
    this.sliderColor = AppColors.calendarBorder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * .7,
      child: SliderButton(
        action: onSlide, // Action to perform on slide
        width: MediaQuery.of(context).size.width * .7,
        label: CustomHeader(
          text: text,
          color: AppColors.calendarBorder,
          fontSize: 16,
        ),
        icon: Icon(
          icon,
          color: backgroundColor, // Icon color matches the background
        ),
        backgroundColor: backgroundColor, // Background color of slider button
        buttonColor: sliderColor, // Color of the slider itself
        shimmer: false, // Disable shimmer effect (optional)
        dismissThresholds: 0.7, // Custom threshold for sliding to confirm
      ),
    );
  }
}
