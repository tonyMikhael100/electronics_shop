import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/widgets/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartModel,
    this.onTapMenu,
    this.onTapPlus,
    this.onTapMinus,
  });
  final CartModel cartModel;
  final void Function()? onTapMenu;
  final void Function()? onTapPlus;
  final void Function()? onTapMinus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.push('/product_details', extra: cartModel.product);
          },
          child: Container(
            height: 80,
            width: 80,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(24)),
            child: Hero(
              tag: cartModel.product.id,
              child: CachedNetworkImage(
                imageUrl: cartModel.product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                cartModel.product.name,
                style: AppTextStyles.displayMedium(context)
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              Text(
                '${cartModel.product.price.toString()} LE',
                style: AppTextStyles.displayMedium(context)
                    .copyWith(fontSize: 16.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    cartModel.product.productCategory,
                    style: AppTextStyles.displaySmall(context).copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: AppColors.tertiary),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: onTapMinus,
                        child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              Assets.images.minusSvgrepoCom,
                              color: AppColors.tertiary,
                              width: 10,
                              fit: BoxFit.scaleDown,
                            )),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        cartModel.quantity.toString(),
                        style: AppTextStyles.displaySmall(context)
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: onTapPlus,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: AppColors.tertiary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
