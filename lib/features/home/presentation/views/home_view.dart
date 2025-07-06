import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_cursor_slider.dart';
import 'package:electronics_shop/widgets/custom_layout_builder.dart';
import 'package:electronics_shop/widgets/product_category_gid_view.dart';
import 'package:electronics_shop/widgets/product_list_builder.dart';
import 'package:electronics_shop/widgets/products_gird_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ...existing imports...

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<WhishlistCubit>(context)
        .fetchWhishlist(tableName: 'wishlists');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    var myHomeCubit = BlocProvider.of<HomeCubit>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 56),
          child: const CustomAppBar(
            title: "Malak Elkhalig",
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.all(16), // <-- Fix: use const EdgeInsets.all
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: CustomCursorSlider()),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Categories',
                  style: AppTextStyles.displayMedium(context),
                ),
              ),
              ProductCategoryGridView(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Featured Products',
                  style: AppTextStyles.displayMedium(context),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    List<ProductModel> products = myHomeCubit.productsList;
                    if (state is HomeDataLoadedState) {
                      return CustomLayoutBuilder(
                        mobileView: ProductListBuilder(
                          prouducts: products,
                        ),
                        webView: ProductsGridBuilder(
                          products: products,
                        ),
                      );
                    } else if (state is HomeProductFailureState) {
                      return Center(
                        child: Text(state.errorMessage,
                            style: AppTextStyles.bodyMedium(context)),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
