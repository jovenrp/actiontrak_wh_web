import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAliasRow extends StatelessWidget {
  final String itemId, itemNum, itemName, sku, type, code, note;
  final bool isHeader;

  const CustomAliasRow({
    super.key,
    this.itemId = '',
    this.itemNum = '',
    this.itemName = '',
    this.sku = '',
    this.type = '',
    this.code = '',
    this.note = '',
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: code, fontSize: isHeader ? 18 : 16, weight: isHeader ? FontWeight.w900 : FontWeight.w400,),
          CustomText(text: type, fontSize: isHeader ? 18 : 16, weight: isHeader ? FontWeight.w900 : FontWeight.w400,),
        ],
      ),
    );
  }
}
