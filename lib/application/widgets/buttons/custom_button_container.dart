import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:flutter/material.dart';

class CustomButtonContainer extends StatelessWidget {
  const CustomButtonContainer({
    super.key,
    this.colors,
    this.textColor,
    this.icons,
    this.text,
    this.bgColor,
    required this.onPressed,
  });

  final Color? colors, textColor, bgColor;
  final IconData? icons;
  final String? text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: bgColor ?? AppColors.primaryContrast,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes the shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icons ?? Icons.payments_outlined),
            const SizedBox(width: 20,),
            CustomHeader(
              text: text,
              color: textColor ?? AppColors.textColor,
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}
