import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/check_out_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/chekcout_stepper.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/order_summary_container.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/select_payment_method_container.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    var myChekcoutCubit = BlocProvider.of<CheckOutCubit>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomAppBar(
          title: 'Payment method',
          // showActionButton: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: BlocBuilder<CheckOutCubit, CheckOutState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckouStepper(
                  isActiveOne: true,
                  isActiveTwo: true,
                  isActiveThree: false,
                ),
                SizedBox(height: 16),
                Text('Payment method',
                    style: AppTextStyles.displayMedium(context)),
                SizedBox(height: 16),
                SelectPaymentMethodContainer(
                  paymentMethod: 'cash on delivery',
                  paymentMethodSvg: SvgPicture.asset(
                    'assets/images/cod.svg',
                    width: 70.w,
                  ),
                  isSelected: myChekcoutCubit.selectedPaymentMethod == 'cod',
                  onTap: () {
                    myChekcoutCubit.selectPaymentMethod(
                        method: 'cod', index: 0);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                SelectPaymentMethodContainer(
                  paymentMethod: 'visa',
                  paymentMethodSvg: SvgPicture.asset(
                    'assets/images/visa.svg',
                    width: 70.w,
                  ),
                  isSelected: myChekcoutCubit.selectedPaymentMethod == 'visa',
                  onTap: () {
                    myChekcoutCubit.selectPaymentMethod(
                        method: 'visa', index: 1);
                  },
                ),
                Spacer(),
                Divider(),
                Text('Order Summary',
                    style: AppTextStyles.displayMedium(context)),
                SizedBox(height: 8),
                OrderSummaryContainer(
                  subTotal: '150',
                  shipping: '10',
                  tax: '5',
                  total: '165',
                ),
                SizedBox(height: 16),
                CustomElevatedButton(
                  icon: Icons.shopping_cart_checkout_rounded,
                  backgroundColor: AppColors.primaryColor,
                  label: 'Confirm Order',
                  onTap: () {
                    //show toast to confirm order
                    //do the order function
                    //navigate to home
                    context.go('/tracking_order');
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
