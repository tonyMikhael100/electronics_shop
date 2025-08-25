import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productItem,
  });

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 170,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.secondary,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Hero(
              tag: productItem.id,
              child: CachedNetworkImage(
                imageUrl: productItem.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${productItem.price} LE',
          style: AppTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.priceColor,
            fontSize: 16.sp,
          ),
        ),
        Text(
          productItem.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        Text(
          productItem.productCategory,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium(context).copyWith(
            fontSize: 14.sp,
            color: AppColors.tertiary,
          ),
        ),
      ],
    );
  }
}
