import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/application/widgets/buttons/custom_button.dart';
import 'package:actiontrak_wh/application/widgets/dialogs/custom_dialog.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCheckboxRow extends StatefulWidget {
  final String itemId, qtyReceived, uom;
  final int id, checkboxState;
  final ValueChanged<int> onCheckboxToggle;
  final VoidCallback onPressed;
  final TextEditingController controller;
  final FocusNode focusNode;

  const CustomCheckboxRow({
    super.key,
    required this.itemId,
    required this.qtyReceived,
    required this.uom,
    required this.id,
    required this.checkboxState,
    required this.onCheckboxToggle,
    required this.onPressed,
    required this.controller,
    required this.focusNode,
  });

  @override
  CustomCheckboxRowState createState() => CustomCheckboxRowState();
}

class CustomCheckboxRowState extends State<CustomCheckboxRow> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color checkboxColor;
    IconData checkboxIcon;

    switch (widget.checkboxState) {
      case 1:
        checkboxColor = AppColors.warningOrange;
        checkboxIcon = Icons.check;
        break;
      case 2:
        checkboxColor = AppColors.green;
        checkboxIcon = Icons.check;
        break;
      default:
        checkboxColor = AppColors.primaryAccent; // Default state
        checkboxIcon = Icons.check_box_outline_blank;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(
          text: 'SKU [${widget.itemId}]',
          fontSize: 15,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.qtyReceived,
                    fontSize: 17,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                    text: widget.uom,
                    fontSize: 16,
                  ),
                ],
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Container(
                  color: Colors.transparent, // Transparent, but still clickable
                  height: 50,
                ),
              )),
              GestureDetector(
                onTap: () => widget.onCheckboxToggle(widget.id),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: checkboxColor.withOpacity(0.2),
                  ),
                  child: Icon(
                    checkboxIcon,
                    color: checkboxColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Animated Expansion for Additional Container
        AnimatedContainer(
          duration: const Duration(milliseconds: 100), // Animation duration
          curve: Curves.easeIn, // Apply ease-in curve
          height: _isExpanded ? 200 : 0, // Animate height
          child: _isExpanded
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: AppColors.grey, // Light background color
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomHeader(text: "Additional Information", fontSize: 16, fontWeight: FontWeight.bold,),
                          const CustomText(text: "Enter the quantity you want to receive:", fontSize: 16),
                          const SizedBox(height: 15),
                          CustomTextField(
                            focusNode: widget.focusNode,
                            hintText: '0',
                            icon: Icons.numbers,
                            controller: widget.controller,
                            textInputType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                          const SizedBox(height: 10),
                          CustomButton(text: 'Submit', onPressed: widget.onPressed),
                        ],
                      ),
                    ),
                  ),
                )
              : null, // Empty if not expanded
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
