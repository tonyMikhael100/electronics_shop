import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsGridBuilder extends StatelessWidget {
  ProductsGridBuilder({
    required this.products,
    super.key,
  });

  List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 3 : 2,
        crossAxisSpacing: 5,
        childAspectRatio: MediaQuery.sizeOf(context).width > 1000 ? 1.4 : 0.7,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.push('/product_details', extra: products[index]);
          },
          child: ProductItem(
            productItem: ProductModel(
                id: products[index].id,
                productCategory: products[index].productCategory,
                description: products[index].description,
                imageUrl: products[index].imageUrl,
                name: products[index].name,
                price: products[index].price,
                status: products[index].status),
          ),
        );
      },
    );
  }
}
