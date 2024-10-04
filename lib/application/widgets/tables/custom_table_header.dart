import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTableHeader extends StatelessWidget {
  final String? header1, header2, header3;

  const CustomTableHeader({
    super.key,
    this.header1 = '',
    this.header2 = '',
    this.header3 = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      color: AppColors.disabledButton,
      child: Row(
        children: [
          const Expanded(flex: 1, child: SizedBox.shrink()),
          Expanded(
            flex: 2,
            child: CustomText(
              text: header1,
              fontSize: 16,
              textAlign: TextAlign.left,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomText(
              text: header2,
              fontSize: 16,
              textAlign: TextAlign.left,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: header3,
              fontSize: 16,
              textAlign: TextAlign.right,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
