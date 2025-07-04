import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.icon,
    this.onTap,
    required this.label,
    this.backgroundColor,
  });
  final IconData icon;
  final void Function()? onTap;
  final String label;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(
        label,
        style: AppTextStyles.bodyLarge(context)
            .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
        size: 25.spMax,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
