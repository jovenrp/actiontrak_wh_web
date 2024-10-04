import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.text,
    this.style,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.fontSize = 24,
    this.color = AppColors.textColor,
    this.fontWeight = FontWeight.bold,
  });

  final String? text;
  final int maxLines;
  final double fontSize;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: maxLines,
      textAlign: textAlign,
      style: style ?? GoogleFonts.lato(textStyle: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight)),
    );
  }
}
