import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCheckboxRow extends StatefulWidget {
  final String itemId;
  final String qtyReceived;
  final String uom;
  final int id; // Unique ID for each row
  final int checkboxState; // State of the checkbox (0, 1, 2)
  final ValueChanged<int> onCheckboxToggle; // Callback to update checkbox state

  const CustomCheckboxRow({
    super.key,
    required this.itemId,
    required this.qtyReceived,
    required this.uom,
    required this.id,
    required this.checkboxState,
    required this.onCheckboxToggle,
  });

  @override
  CustomCheckboxRowState createState() => CustomCheckboxRowState();
}

class CustomCheckboxRowState extends State<CustomCheckboxRow> {
  bool _isExpanded = false; // Tracks whether the extra container is visible
  final TextEditingController _textController = TextEditingController(); // TextField controller

  @override
  Widget build(BuildContext context) {
    Color checkboxColor;
    IconData checkboxIcon;

    switch (widget.checkboxState) {
      case 1:
        checkboxColor = Colors.orange;
        checkboxIcon = Icons.check;
        break;
      case 2:
        checkboxColor = Colors.green;
        checkboxIcon = Icons.check;
        break;
      default:
        checkboxColor = Colors.grey; // Default state
        checkboxIcon = Icons.check_box_outline_blank;
        break;
    }

    return Column(
      children: [
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
                    fontSize: 16,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                    text: widget.uom,
                    fontSize: 14,
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
          height: _isExpanded ? 150 : 0, // Animate height
          child: _isExpanded
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Light background color
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Additional Information", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const Text("Please provide more details:"),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Details",
                            ),
                          ),
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
    _textController.dispose(); // Dispose the controller when widget is removed
    super.dispose();
  }
}
