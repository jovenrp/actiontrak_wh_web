import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:flutter/material.dart';

class ItemAliasCard extends StatelessWidget {
  final String itemId, itemNum, itemName, sku, type, code, note;

  const ItemAliasCard({
    super.key,
    this.itemId = '',
    this.itemNum = '',
    this.itemName = '',
    this.sku = '',
    this.type = '',
    this.code = '',
    this.note = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: AppColors.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomHeader(text: 'ITEM $itemNum', fontSize: 16,),
              CustomHeader(text: 'SKU $sku', fontSize: 16,),
            ],
          ),
          const SizedBox(height: 5,),
          CustomHeader(
            text: itemName,
            fontWeight: FontWeight.w900,
          ),
        ],
      ),
    );
  }
}
