import 'package:electronics_shop/core/app_colors.dart';
import 'package:electronics_shop/core/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Ionicons.arrow_back, color: AppColors.primaryColor),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Mobiles',
          style: AppTextStyles.displayLarge(context)
              .copyWith(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 10,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.sizeOf(context).width > 700 ? 4 : 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7),
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
      ),
    );
  }
}
