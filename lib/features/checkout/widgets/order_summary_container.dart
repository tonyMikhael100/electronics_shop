import 'package:electronics_shop/core/app_styles.dart';
import 'package:flutter/material.dart';

class OrderSummaryContainer extends StatelessWidget {
  const OrderSummaryContainer({
    super.key,
    required this.subTotal,
    required this.shipping,
    required this.tax,
    required this.total,
  });
  final String subTotal;
  final String shipping;
  final String tax;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: AppTextStyles.bodyMedium(context)),
              Text(subTotal.toString(),
                  style: AppTextStyles.bodyMedium(context)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping', style: AppTextStyles.bodyMedium(context)),
              Text(shipping.toString(),
                  style: AppTextStyles.bodyMedium(context)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax', style: AppTextStyles.bodyMedium(context)),
              Text(tax.toString(), style: AppTextStyles.bodyMedium(context)),
            ],
          ),
          Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: AppTextStyles.bodyMedium(context)
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(total.toString(),
                  style: AppTextStyles.bodyMedium(context)
                      .copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
