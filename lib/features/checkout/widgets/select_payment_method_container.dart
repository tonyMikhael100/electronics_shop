import 'package:electronics_shop/core/app_colors.dart';
import 'package:flutter/material.dart';

class SelectPaymentMethodContainer extends StatelessWidget {
  const SelectPaymentMethodContainer({
    super.key,
    required this.paymentMethod,
    required this.paymentMethodSvg,
    this.onTap,
    required this.isSelected,
  });
  final String paymentMethod;
  final Widget paymentMethodSvg;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: isSelected
            ? Border.all(color: AppColors.primaryColor, width: 2)
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: paymentMethodSvg,
        title: Text(paymentMethod),
        onTap: onTap,
      ),
    );
  }
}
