import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/models/whishlist_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final myWhishlistCubit = BlocProvider.of<WhishlistCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Ionicons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Wishlist',
          style: AppTextStyles.displayLarge(context)
              .copyWith(color: AppColors.primaryColor),
        ),
      ),
      body: BlocBuilder<WhishlistCubit, WhishlistState>(
        buildWhen: (previous, current) {
          return current is AddWhishlistState ||
              current is FetchWhishlitState ||
              current is FailureWhishlitState;
        },
        builder: (context, state) {
          final products = myWhishlistCubit.products;
          if (state is FetchWhishlitState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.sizeOf(context).width > 700 ? 4 : 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => context.push('/product_details',
                        extra: products[index]),
                    child: ProductItem(productItem: products[index]),
                  );
                },
              ),
            );
          } else if (state is FailureWhishlitState ||
              myWhishlistCubit.products.isEmpty) {
            return Center(
              child: Text(
                'No wishlist items yet!',
                style: AppTextStyles.displayMedium(context),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
        },
      ),
    );
  }
}
