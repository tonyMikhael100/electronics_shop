import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:electronics_shop/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewProductsView extends StatelessWidget {
  const ReviewProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final myCartCubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: myCartCubit.currentCartList.length,
        itemBuilder: (contex, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IgnorePointer(
              ignoring: true,
              child: CartItem(
                cartModel: myCartCubit.currentCartList[index],
                showButtons: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
