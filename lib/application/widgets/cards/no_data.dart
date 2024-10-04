import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String title, message;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final TextStyle? textStyle;

  const NoData({
    super.key,
    this.title = 'Oops!',
    this.message = 'No results at the moment',
    this.icon = Icons.inbox,  // Default icon
    this.iconSize = 64.0,     // Default icon size
    this.iconColor = Colors.grey, // Default icon color
    this.textStyle,           // Optional custom text style
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        const SizedBox(height: 10.0), // Space between icon and text
        CustomHeader(
          text: title,
          fontWeight: FontWeight.w900,
        ),
        CustomHeader(
          text: message,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
