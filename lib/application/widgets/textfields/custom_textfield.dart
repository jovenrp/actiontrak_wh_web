import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.inputFormatters,
    this.textInputType,
    this.focusNode,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true; // To control password visibility

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      // Hide or show password
      inputFormatters: widget.inputFormatters ?? [],
      keyboardType: widget.textInputType ?? TextInputType.text,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: AppColors.primaryContrast,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle the obscureText
                  });
                },
              )
            : null,
      ),
      validator: widget.validator ??
          (String? value) {
            return null;
          },
      onChanged: widget.onChanged ?? (String? value) {},
      onTap: () {
        if (widget.focusNode != null) {
          Future.delayed(const Duration(milliseconds: 500), () {
            print('asdasd');
            widget.focusNode?.requestFocus();
          });
        }
      },
    );
  }
}
