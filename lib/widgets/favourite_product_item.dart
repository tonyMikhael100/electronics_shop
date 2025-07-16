import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteProductItem extends StatelessWidget {
  const FavouriteProductItem({
    super.key,
    required this.product,
    this.onTapAddToCart,
    this.onTapColumn,
  });

  final ProductModel product;
  final Function()? onTapAddToCart;
  final Function()? onTapColumn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(24)),
          child: Hero(
            tag: product.id,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: InkWell(
            onTap: onTapColumn,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.displayMedium(context)
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                Text(
                  '${product.price.toString()} LE',
                  style: AppTextStyles.displayMedium(context)
                      .copyWith(fontSize: 16.sp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.productCategory,
                      style: AppTextStyles.displaySmall(context).copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: AppColors.tertiary),
                    ),
                    InkWell(
                      onTap: onTapAddToCart,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.secondary,
                        ),
                        child: SvgPicture.asset(
                          Assets.images.cart,
                          width: 20,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
