import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/checkout/data/models/delivery_model.dart';
import 'package:flutter/material.dart';

class DeliveryRowSelect extends StatelessWidget {
  const DeliveryRowSelect(
      {super.key, required this.deliveryModel, required this.isSelected});

  final DeliveryModel deliveryModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : AppColors.tertiary,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            deliveryModel.deliveryZone,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.displaySmall(context)
                .copyWith(color: Colors.white),
          ),
          Text(
            deliveryModel.deliveryCost.toString() + '  KWD',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.displaySmall(context)
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
