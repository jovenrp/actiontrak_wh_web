import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

class CustomStatusWidget extends StatelessWidget {
  const CustomStatusWidget(
      {super.key, this.status, this.turns, this.size, this.isPartial});

  final String? status;
  final String? isPartial;
  final int? turns;
  final double? size;

  @override
  Widget build(BuildContext context) {
    switch (status?.toLowerCase()) {
      case 'picking':
        return const Icon(Icons.circle_notifications,
            color: AppColors.warningOrange, size: 12);
      case 'picked':
        return const Icon(Icons.arrow_circle_up,
            color: AppColors.primaryAccent, size: 12);
      case 'closed':
        return const Icon(Icons.check_circle,
            color: AppColors.success, size: 12);
      case 'counted':
        return const Icon(Icons.check_circle,
            color: AppColors.success, size: 12);
      case 'partial':
        return Container(
          decoration: BoxDecoration(
              color: AppColors.warningOrange,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: AppColors.warningOrange)),
          child: SizedBox(
            width: size,
            height: size,
            child: Container(
              alignment: Alignment.center,
              child: const CustomText(text: '!', fontSize: 8, color: AppColors.surface),
            ),
          ),
        );
      case 'processing':
        return Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: AppColors.warning)),
          child: RotatedBox(
            quarterTurns: turns ?? 0,
            child: SizedBox(
              width: size ?? 10,
              height: size ?? 10,
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.hourglass_bottom,
                  color: AppColors.warning,
                  size: size ?? 10,
                ),
              ),
            ),
          ),
        );
      case 'processed':
        if (isPartial?.toLowerCase() == 'y') {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.warningOrange,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1, color: AppColors.warningOrange)),
            child: SizedBox(
              width: 10,
              height: 10,
              child: Container(
                alignment: Alignment.center,
                child:
                    const CustomText(text: '!', fontSize: 8, color: AppColors.surface),
              ),
            ),
          );
        }
        return Container(
          decoration: BoxDecoration(
              color: AppColors.success,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: AppColors.success)),
          child: SizedBox(
            width: size,
            height: size,
            child: Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.check,
                color: AppColors.white,
                size: size,
              ),
            ),
          ),
        );
      default:
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: AppColors.secondaryAccent)),
          child: SizedBox(width: size, height: size),
        );
    }
  }
}
