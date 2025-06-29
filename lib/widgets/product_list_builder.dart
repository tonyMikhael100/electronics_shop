import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.push('/product_details');
            },
            child: ProductItem(
              productItem: ProductItemModel(
                rate: 5,
                imageUrl:
                    'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/reno13-series/list-page/reno13-pro-5g/purple.png',
                productName: 'samsung s25 ulatra pro max 128 gb 8 ram ',
                prductCategory: 'Mobile',
                status: 'avalible',
                price: '1500',
              ),
            ),
          );
        },
      ),
    );
  }
}
