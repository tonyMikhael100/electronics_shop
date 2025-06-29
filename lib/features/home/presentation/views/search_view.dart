import 'package:electronics_shop/core/app_colors.dart';
import 'package:electronics_shop/core/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/widgets/filter_list_tile.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

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
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search products...',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black26, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          style: AppTextStyles.bodyMedium(context),
          onChanged: (value) {
            // Handle search logic here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Ionicons.filter, color: AppColors.primaryColor),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FilterListTile(
                        title: 'Price: Low to High',
                        icon: Ionicons.arrow_down,
                        onTap: () {
                          // Handle filter: Price Low to High
                          Navigator.pop(context);
                        },
                      ),
                      FilterListTile(
                        title: 'Price: High to Low',
                        icon: Ionicons.arrow_up,
                        onTap: () {
                          // Handle filter: Price High to Low
                          context.pop();
                        },
                      ),
                      FilterListTile(
                        title: 'Newest',
                        icon: Ionicons.newspaper,
                        onTap: () {
                          context.pop();
                        },
                      ),
                      FilterListTile(
                        title: 'Top Rated',
                        icon: Ionicons.star,
                        onTap: () {
                          context.pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
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
