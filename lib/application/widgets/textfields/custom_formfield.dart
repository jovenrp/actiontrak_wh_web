import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxlines;

  const CustomFormField({super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.maxlines = 3,
  });

  @override
  CustomFormFieldState createState() => CustomFormFieldState();
}

class CustomFormFieldState extends State<CustomFormField> {
  bool _isObscured = true; // To control password visibility

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false, // Hide or show password
      maxLines: widget.maxlines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
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
      validator: widget.validator ?? (String? value) {
        return null;
      },
    );
  }
}