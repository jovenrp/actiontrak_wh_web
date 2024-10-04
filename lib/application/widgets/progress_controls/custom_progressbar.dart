import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; // Value should be between 0.0 and 1.0

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * .79,
        height: 10.0,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress.clamp(0.0, 1.0), // Ensure progress is between 0.0 and 1.0
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [
                    AppColors.progressColorStart,
                    AppColors.progressColorEnd,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}
