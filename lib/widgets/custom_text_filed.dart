import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.label,
    this.onChanged,
    this.suffixIcon,
  });
  final String label;
  final Function(String)? onChanged;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon),
        fillColor: AppColors.secondary,
        filled: true,
        label: Text(
          label,
          style: AppTextStyles.bodyLarge(context).copyWith(
            color: AppColors.tertiary,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
