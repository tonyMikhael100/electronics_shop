import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/checkout/data/models/address_model.dart';
import 'package:electronics_shop/widgets/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddressContainer extends StatelessWidget {
  const CustomAddressContainer({
    super.key,
    required this.addressModel,
    required this.isSelected,
    required this.onTap,
  });
  final AddressModel addressModel;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: AppColors.accent, width: 2)
            : Border.all(color: AppColors.primary),
        color: AppColors.tertiary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(2),
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomSmallButton(
                icon: Icons.delete,
                bgColor: AppColors.accent,
                iconColor: Colors.white,
                onTap: onTap,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Street : ',
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: AppColors.accent, fontSize: 14.sp),
              ),
              Text(
                addressModel.street,
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: AppColors.primary, fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'building : ',
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: AppColors.accent, fontSize: 14.sp),
              ),
              Text(
                addressModel.building,
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: AppColors.primary, fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'floor : ',
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: AppColors.accent, fontSize: 14.sp),
              ),
              Text(
                addressModel.floor,
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: AppColors.primary, fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'aprtment : ',
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: AppColors.accent, fontSize: 14.sp),
              ),
              Text(
                addressModel.apartment,
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: AppColors.primary, fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
