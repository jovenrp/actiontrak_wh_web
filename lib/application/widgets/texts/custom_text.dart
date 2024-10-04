import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.text,
    this.color = AppColors.textColor,
    this.weight = FontWeight.w400,
    this.style,
    this.fontSize = 14,
    this.textAlign = TextAlign.left,
  });

  final String? text;
  final TextStyle? style;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      style: style ??
          GoogleFonts.roboto(
            textStyle: TextStyle(color: color, fontSize: fontSize, fontWeight: weight),
          ),
    );
  }
}
