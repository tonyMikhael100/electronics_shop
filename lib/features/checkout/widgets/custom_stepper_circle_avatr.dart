import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepperCircleAvatar extends StatelessWidget {
  const CustomStepperCircleAvatar({
    super.key,
    required this.index,
    required this.title,
    required this.isActive,
  });
  final String index;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor:
              isActive ? AppColors.primaryColor : Colors.grey.shade400,
          radius: 40.r,
          child: Text(
            index,
            style: AppTextStyles.displayMedium(context)
                .copyWith(color: Colors.white),
          ),
        ),
        Text(
          title,
          style: AppTextStyles.displaySmall(context),
        ),
      ],
    );
  }
}
