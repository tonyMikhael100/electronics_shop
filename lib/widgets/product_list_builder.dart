import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductListBuilder extends StatelessWidget {
  ProductListBuilder({
    required this.prouducts,
    super.key,
  });

  List<ProductModel> prouducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: prouducts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.push('/product_details', extra: prouducts[index]);
            },
            child: ProductItem(
              productItem: ProductModel(
                id: prouducts[index].id,
                productCategory: prouducts[index].productCategory,
                description: prouducts[index].description,
                imageUrl: prouducts[index].imageUrl,
                name: prouducts[index].name,
                price: prouducts[index].price,
                status: prouducts[index].status,
              ),
            ),
          );
        },
      ),
    );
  }
}
