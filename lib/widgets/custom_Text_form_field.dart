import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    required this.labelText,
    this.suffixIcon,
    required this.onChanged,
    this.obscureText,
  });
  final String? Function(String?)? validator;
  final String labelText;
  final IconData? suffixIcon;
  final void Function(String) onChanged;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      autofocus: true,
      decoration: InputDecoration(
        suffixIcon: Icon(
          suffixIcon,
          color: AppColors.tertiary,
        ),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
