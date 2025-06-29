import 'package:electronics_shop/core/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCategoryGridView extends StatelessWidget {
  ProductCategoryGridView({
    super.key,
  });

  List<ProductCategoryModel> products = [
    ProductCategoryModel(image: 'assets/images/iphone2.png', text: 'Mobiles'),
    ProductCategoryModel(
        image: 'assets/images/headphone.png', text: 'Headphones'),
    ProductCategoryModel(image: 'assets/images/ipad.png', text: 'Tablet'),
    ProductCategoryModel(
        image: 'assets/images/accessories.png', text: 'Accessories'),
    ProductCategoryModel(image: 'assets/images/more.png', text: 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.push('/category');
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Image.asset(
                      products[index].image,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    products[index].text,
                    style: AppTextStyles.bodyMedium(context),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
