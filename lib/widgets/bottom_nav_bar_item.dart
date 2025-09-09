import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.isActive,
    required this.onTap,
  });
  final String imageUrl;
  final String label;
  final bool isActive;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            width: 18.w,
            imageUrl,
            color: isActive ? AppColors.accent : AppColors.tertiary,
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.displaySmall(context).copyWith(
                color: isActive ? AppColors.accent : AppColors.tertiary,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
