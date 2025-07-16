import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/models/whishlist_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/favourite_product_item.dart';
import 'package:electronics_shop/widgets/not_found_widget.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.tertiary,
      onRefresh: () async {
        BlocProvider.of<WhishlistCubit>(context)
            .fetchWhishlist(tableName: 'wishlists');
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: CustomAppBar(
            title: 'Wishlist',
            showBackButton: false,
          ),
        ),
        body: BlocBuilder<WhishlistCubit, WhishlistState>(
          builder: (context, state) {
            final cubit = context.read<WhishlistCubit>();

            // Loading state
            if (state is WhishlistLoadingState) {
              return buildDumyList();
            }

            // Error state
            if (state is FailureWhishlitState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppTextStyles.displayMedium(context),
                ),
              );
            }

            // No items
            if (cubit.products.isEmpty) {
              return NotFoundWidget(
                title: 'No Wishinglit Yet !,',
              );
            }
            // Success
            return ListView.builder(
              itemCount: cubit.products.length,
              itemBuilder: (context, index) {
                final product = cubit.products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: FavouriteProductItem(
                    product: product,
                    onTapColumn: () {
                      context.push('/product_details', extra: product);
                    },
                    onTapAddToCart: () {},
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildDumyList() {
    return Skeletonizer(
      enabled: true,
      ignorePointers: true,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: FavouriteProductItem(
              product: ProductModel(
                  id: 'dumy',
                  productCategory: 'dumy',
                  name: 'dumy',
                  description: 'dumy',
                  price: 1000,
                  imageUrl:
                      'https://nclsdhzpcxkiizuunell.supabase.co/storage/v1/object/public/images//fff.png',
                  status: 'dumy'),
              onTapColumn: () {},
            ),
          );
        },
      ),
    );
  }
}
