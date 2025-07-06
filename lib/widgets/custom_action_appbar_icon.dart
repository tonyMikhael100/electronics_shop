import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
import 'package:electronics_shop/widgets/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CutsomActionAppBarIcons extends StatelessWidget {
  const CutsomActionAppBarIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSmallButton(
          icon: Ionicons.search,
          onTap: () {
            context.push('/search');
          },
        ),
        SizedBox(
          width: 8,
        ),
        CustomSmallButton(
          icon: Ionicons.person,
          onTap: () {},
        ),
        SizedBox(
          width: 8,
        ),
        CustomSmallButton(
          icon: Ionicons.heart,
          onTap: () {
            context.push('/favourite');
          },
        ),
        SizedBox(
          width: 8,
        ),
        InkWell(
          onTap: () {},
          child: Stack(
            children: [
              CustomSmallButton(
                icon: Ionicons.cart,
                onTap: () {
                  context.push('/cart');
                },
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Text(
                    '10',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
