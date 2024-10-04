import 'package:actiontrak_wh/application/utils/string_extensions.dart';
import 'package:actiontrak_wh/application/widgets/icons/custom_status_widget.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/app_colors.dart';

class PickTicketCard extends StatelessWidget {
  const PickTicketCard({super.key, this.orderNo, this.location, this.status, this.lines, this.turns = 0, this.isPartial = 'n', this.size = 10, this.processingBy});

  final String? orderNo, location, status, lines, isPartial, processingBy;
  final int turns;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: AppColors.surface
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomStatusWidget(
                status: status,
                turns: turns,
                isPartial: isPartial,
                size: size,
              ),
              const SizedBox(width: 10,),
              CustomText(text: status?.capitalizeFirstofEach(), weight: FontWeight.w500, fontSize: 16,),
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              CustomText(text: orderNo, weight: FontWeight.w900, fontSize: 16,),
              const Spacer(),
              CustomText(text: 'Lines: $lines', fontSize: 16,),
            ],
          ),
          CustomText(text: location, fontSize: 16,),
          const SizedBox(height: 5,),
          CustomText(text: 'Processing by $processingBy', fontSize: 14,),
        ],
      ),
    );
  }
}