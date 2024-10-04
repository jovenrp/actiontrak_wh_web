import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/icons/custom_status_widget.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

class CustomReceiveRow extends StatelessWidget {
  final String? orderNumber, location, lines, status;
  final int turns;
  final double size;
  final String isPartial;
  final bool isOdd;

  const CustomReceiveRow({
    super.key,
    this.orderNumber = '',
    this.location = '',
    this.status = '',
    this.lines = '',
    this.turns = 0,
    this.isPartial = 'n',
    this.size = 10,
    this.isOdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      color: isOdd ? AppColors.background : AppColors.calendarBorder,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 28),
              child: CustomStatusWidget(
                status: status,
                turns: turns,
                isPartial: isPartial,
                size: size,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(text: orderNumber?.isNotEmpty == true ? 'PO-$orderNumber' : orderNumber.toString(), textAlign: TextAlign.left, fontSize: 16,),
          ),
          Expanded(
            flex: 3,
            child: CustomText(text: location.toString(), fontSize: 16, textAlign: TextAlign.left,),
          ),
          Expanded(
            flex: 1,
            child: CustomText(text: lines.toString(), fontSize: 16, textAlign: TextAlign.right,),
          ),
        ],
      ),
    );
  }
}
