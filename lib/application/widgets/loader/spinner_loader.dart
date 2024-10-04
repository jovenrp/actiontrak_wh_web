import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utils/app_colors.dart';

class SpinnerLoader extends StatelessWidget {
  const SpinnerLoader({
    super.key,
    this.backgroundColor,
    this.strokeWidth,
  });

  final Color? backgroundColor;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: LoadingAnimationWidget.fourRotatingDots(
          color: backgroundColor ?? AppColors.primaryAccent, size: strokeWidth ?? 60),
    );
  }
}
