import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/buttons/custom_button.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

enum IconType {
  success,
  error,
  warning,
  info,
  none,
}

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmButtonText;
  final String? cancelButtonText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final IconType? type;
  final Widget? extraWidget;
  final bool noButton;

  const CustomDialog(
      {super.key,
      this.type,
      required this.title,
      required this.content,
      required this.confirmButtonText,
      this.cancelButtonText,
      required this.onConfirm,
      this.onCancel,
      this.extraWidget,
      this.noButton = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 375,
          decoration: const BoxDecoration(
            color: AppColors.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                switch (type) {
                  IconType.success => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Image.asset(
                        'assets/images/png/success_icon.png',
                        height: 48,
                      ),
                    ),
                  IconType.info => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Image.asset(
                        'assets/images/png/info_icon.png',
                        height: 48,
                      ),
                    ),
                  IconType.warning => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Image.asset(
                        'assets/images/png/warning_icon.png',
                        height: 48,
                      ),
                    ),
                  IconType.error => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Image.asset(
                        'assets/images/png/error_icon.png',
                        height: 48,
                      ),
                    ),
                  _ => const SizedBox.shrink(),
                },
                CustomHeader(
                  text: title,
                  fontSize: 24,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                extraWidget ?? const SizedBox.shrink(),
                CustomText(
                  text: content,
                  fontSize: 16,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                noButton
                  ? const SizedBox.shrink()
                  : CustomButton(
                  text: confirmButtonText,
                  onPressed: () {
                    onConfirm();
                    //Navigator.of(context).pop();
                  }),
              const SizedBox(
                height: 5,
              ),
                if (cancelButtonText != null)
                  CustomButton(
                      text: cancelButtonText!,
                      isSecondaryButton: true,
                      onPressed: () {
                        if (onCancel != null) {
                          onCancel!();
                        }
                        Navigator.of(context).pop();
                      }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context,
    {required String title,
    required String content,
    required String confirmButtonText,
    String? cancelButtonText,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    IconType? type,
    Widget? extraWidget,
    bool noButton = false}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomDialog(
        type: type,
        title: title,
        content: content,
        confirmButtonText: confirmButtonText,
        onConfirm: onConfirm,
        noButton: noButton,
        extraWidget: extraWidget,
        cancelButtonText: cancelButtonText,
        onCancel: onCancel,
      );
    },
  );
}
