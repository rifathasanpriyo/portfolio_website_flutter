import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;

  const CustomInputField({
    super.key,
    required this.hint,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: AppColors.textFieldBg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
