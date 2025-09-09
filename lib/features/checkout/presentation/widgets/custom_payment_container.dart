import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/checkout/data/models/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomPaymentContainer extends StatelessWidget {
  const CustomPaymentContainer({
    super.key,
    required this.paymentModel,
    required this.isSelected,
  });
  final PaymentModel paymentModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
        border:
            isSelected ? Border.all(color: AppColors.accent, width: 2) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            paymentModel.paymentImage,
            width: 30.w,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            paymentModel.paymentMethod,
            style:
                AppTextStyles.displaySmall(context).copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
