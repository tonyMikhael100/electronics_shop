import 'package:electronics_shop/core/app_styles.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_cursor_slider.dart';
import 'package:electronics_shop/widgets/custom_layout_builder.dart';
import 'package:electronics_shop/widgets/product_category_gid_view.dart';
import 'package:electronics_shop/widgets/product_list_builder.dart';
import 'package:electronics_shop/widgets/products_gird_builder.dart';
import 'package:flutter/material.dart';
// ...existing imports...

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: CustomLayoutBuilder(
                  mobileView: ProductListBuilder(),
                  webView: ProductsGridBuilder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
