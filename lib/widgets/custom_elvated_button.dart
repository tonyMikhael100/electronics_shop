import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.icon,
    this.onTap,
    required this.label,
    this.backgroundColor,
    this.width,
  });
  final void Function()? onTap;
  final String label;
  final Color? backgroundColor;
  final double? width;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(
        label,
        style: AppTextStyles.bodyLarge(context)
            .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      icon: icon,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
