import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({
    super.key,
    required this.shipping,
    required this.total,
  });
  final double shipping;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppColors.tertiary,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'shipping',
              style:
                  AppTextStyles.displaySmall(context).copyWith(fontSize: 14.sp),
            ),
            Text(
              '${shipping.toString()} LE',
              style:
                  AppTextStyles.displaySmall(context).copyWith(fontSize: 14.sp),
            )
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'total',
              style:
                  AppTextStyles.displaySmall(context).copyWith(fontSize: 14.sp),
            ),
            Text(
              '${total.toString()} LE',
              style:
                  AppTextStyles.displaySmall(context).copyWith(fontSize: 14.sp),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
