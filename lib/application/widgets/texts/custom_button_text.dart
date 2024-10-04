import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class CustomButtonText extends StatelessWidget {
  const CustomButtonText({super.key, this.text, this.style, this.isSecondary = false,});

  final String? text;
  final TextStyle? style;
  final bool isSecondary;
  @override
  Widget build(BuildContext context ) {
    return Text(text ?? '', style: style ?? GoogleFonts.roboto(
        textStyle: TextStyle(color: isSecondary ? AppColors.textColor : AppColors.white, fontSize: 18, fontWeight: FontWeight.w500)
    ),);
  }
}