import 'package:electronics_shop/core/app_colors.dart';
import 'package:electronics_shop/core/app_styles.dart';
import 'package:electronics_shop/widgets/cart_item.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Ionicons.arrow_back, color: AppColors.primaryColor),
          onPressed: () {
            context.pop();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: AppTextStyles.displayLarge(context)
              .copyWith(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with your cart items count
                itemBuilder: (context, index) {
                  return CartItem();
                },
              ),
            ),
            Divider(
              color: Colors.grey.shade800,
              thickness: 1,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount: ', // Replace with your total amount
                      style: AppTextStyles.displayMedium(context),
                    ),
                    Text(
                      '\$ 1500 ', // Replace with your total amount
                      style: AppTextStyles.displayMedium(context),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('delivery: ',
                        style: AppTextStyles.displayMedium(context)),
                    Text('\$ 15 ', style: AppTextStyles.displayMedium(context)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomElevatedButton(
              icon: Ionicons.wallet,
              label: 'Checkout',
              backgroundColor: AppColors.primaryColor,
              onTap: () {
                context.push('/delivery_address');
              },
            ),
          ],
        ),
      ),
    );
  }
}
