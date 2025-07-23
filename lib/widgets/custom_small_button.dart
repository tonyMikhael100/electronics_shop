import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.icon,
    this.onTap,
    required this.bgColor,
    required this.iconColor,
  });
  final IconData icon;
  final void Function()? onTap;
  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          size: 22.sp,
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
