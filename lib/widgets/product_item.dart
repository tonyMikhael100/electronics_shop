import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/widgets/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    super.key,
    required this.productItem,
  });

  ProductItemModel productItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Colors.black12)
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: productItem.imageUrl,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  productItem.status,
                  style: AppTextStyles.displaySmall(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                productItem.productName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyMedium(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                productItem.prductCategory,
                style: AppTextStyles.displaySmall(context)
                    .copyWith(color: Colors.black38),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${productItem.price} ',
                    style: AppTextStyles.titleMedium(context),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomSmallButton(
                      icon: Icons.add_shopping_cart,
                      onTap: () {
                        MyToast.showMyToast(
                          context,
                          icon: Icons.done,
                          title: 'Added to Cart',
                          bgColor: AppColors.primaryColor,
                        );
                        print('add to cart');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 249, 178, 86),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 25.sp,
                    color: Colors.deepOrangeAccent,
                  ),
                  Text(
                    ' ${productItem.rate}.0',
                    style: AppTextStyles.displaySmall(context)
                        .copyWith(color: Colors.deepOrangeAccent),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
