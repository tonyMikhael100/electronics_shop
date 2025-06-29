import 'package:electronics_shop/core/app_colors.dart';
import 'package:electronics_shop/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryToContainer extends StatelessWidget {
  const DeliveryToContainer({
    super.key,
    required this.addressType,
    required this.address,
    required this.onPressedEdit,
    required this.isSelected,
    this.onPressedDelete,
  });

  final String addressType;
  final String address;
  final void Function()? onPressedEdit;
  final bool isSelected;
  final void Function()? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: AppColors.primaryColor, width: 2)
            : null,
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  addressType,
                  style: AppTextStyles.displayMedium(context),
                ),
                Text(
                  address,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.displaySmall(context)
                      .copyWith(color: Colors.black45),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: onPressedEdit,
                  icon: Icon(
                    Icons.edit,
                    color: AppColors.primaryColor,
                  )),
              IconButton(
                onPressed: onPressedDelete,
                icon: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
