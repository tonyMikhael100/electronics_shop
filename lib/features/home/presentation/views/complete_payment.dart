import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CompletePayment extends StatelessWidget {
  const CompletePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animation
          LottieBuilder.asset(
            Assets.animation.orderPlaced,
            width: 200.w,
          ),

          SizedBox(height: 24.h),

          // Success Message
          Text(
            'Your order has been placed successfully!',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'Thank you for shopping with us.\nYou will receive a confirmation email shortly.',
            style: AppTextStyles.displaySmall(context)
                .copyWith(color: Colors.black54, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          CustomElevatedButton(
            icon: Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 28.sp,
              color: Colors.white,
            ),
            backgroundColor: AppColors.accent,
            onTap: () {
              context.pushReplacement('/home_view');
            },
            width: double.infinity,
            label: 'Go to Home',
          )
        ],
      ),
    );
  }
}
