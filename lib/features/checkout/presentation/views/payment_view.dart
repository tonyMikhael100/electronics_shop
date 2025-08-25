import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/payment_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/custom_payment_container.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/total_price_section.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    final myPaymentCubit = BlocProvider.of<PaymentCubit>(context);
    final myCartCubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Select Payment Method',
                style: AppTextStyles.bodyLarge(context),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.payment),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: myPaymentCubit.paymentMethods.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      myPaymentCubit.changeSelectedPayment(index);
                    },
                    child: CustomPaymentContainer(
                      paymentModel: myPaymentCubit.paymentMethods[index],
                      isSelected: myPaymentCubit.selectedPayment == index,
                    ),
                  );
                },
              );
            },
          ),
          TotalPriceSection(
              shipping: 70.0, total: myCartCubit.total.toDouble()),
        ],
      ),
    );
  }
}
