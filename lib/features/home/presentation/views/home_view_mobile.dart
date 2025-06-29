import 'package:electronics_shop/core/app_colors.dart';
import 'package:electronics_shop/core/app_styles.dart';
import 'package:electronics_shop/widgets/custom_action_appbar_icon.dart';
import 'package:electronics_shop/widgets/custom_cursor_slider.dart';
import 'package:electronics_shop/widgets/product_category_gid_view.dart';
import 'package:flutter/material.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Malak El5alig',
          style: AppTextStyles.displayMedium(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        actions: [CutsomActionAppBarIcons()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomCursorSlider(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Categories',
                style: AppTextStyles.displayMedium(context),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            ProductCategoryGridView(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: Text('Featured Products',
                  style: AppTextStyles.displayMedium(context)),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
