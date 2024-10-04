import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color titleColor;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor = AppColors.primaryAccent, // Default Charcoal
    this.titleColor = AppColors.white,
    this.showBackButton = false,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            showBackButton ? Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: AppColors.surface,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                  size: 22,
                ),
                onPressed: onBackButtonPressed ??
                    () {
                      Navigator.of(context).pop(); // Default back action
                    },
              ),
            ) : const SizedBox.shrink(),
            CustomHeader(text: title, fontWeight: FontWeight.w900,)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UniversalPlatform.isWeb ? 50 : 100);
}
