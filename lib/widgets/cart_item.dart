import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/widgets/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 1),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          context.push('/product_details');
        },
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/reno13-series/list-page/reno13-pro-5g/purple.png',
              fit: BoxFit.contain,
              width: 200.w,
              height: 200.h,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 900.w),
                        child: Text(
                          'Product Name',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.displayMedium(context),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Ionicons.trash_outline),
                        iconSize: 25,
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Mobile',
                    style: AppTextStyles.displaySmall(context)
                        .copyWith(color: Colors.black38),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$499.99',
                        style: AppTextStyles.displayMedium(context).copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          CustomSmallButton(
                            icon: Ionicons.add,
                            onTap: () {},
                          ),
                          SizedBox(width: 10),
                          Text(
                            '1',
                            style:
                                AppTextStyles.displayMedium(context).copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          CustomSmallButton(
                            icon: Ionicons.remove,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
