import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/address_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/delivery_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/payment_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/custom_payment_container.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DeliveryCubit>().getDeliveryCostByAddressId(
        addressId: context
            .read<AddressCubit>()
            .currentAddresses[context.read<AddressCubit>().selectedAddress]
            .id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                l10n.selectPaymentMethod,
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
          BlocBuilder<DeliveryCubit, DeliveryState>(
            builder: (context, state) {
              if (state is DeliveryCostLoadingState) {
                return Skeletonizer(
                    child: Row(
                  children: [Text('loading')],
                ));
              }
              if (state is DeliveryCostSuccessState) {
                return Column(
                  children: [
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'shipping : ',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                        Text(
                          '${context.read<DeliveryCubit>().deliveryCost} KWD',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total : ',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                        Text(
                          '${context.read<CartCubit>().total} KWD',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total : ',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                        Text(
                          '${context.read<CartCubit>().total + context.read<DeliveryCubit>().deliveryCost} KWD',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
