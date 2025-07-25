import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/widgets/custom_cursor_slider.dart';
import 'package:electronics_shop/widgets/product_category_gid_view.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:electronics_shop/widgets/product_list_builder.dart';
import 'package:electronics_shop/widgets/products_gird_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var MyHomeCubit = BlocProvider.of<HomeCubit>(context);
    return RefreshIndicator(
      backgroundColor: AppColors.secondary,
      color: AppColors.tertiary,
      onRefresh: () async {
        MyHomeCubit.fetchBanners(tableName: 'banner');
        MyHomeCubit.fetchCategories(tableName: 'categories');
        MyHomeCubit.fetchProducts(tableName: 'products');
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            //opend advanced Drawer
                          },
                          child: SvgPicture.asset(
                            Assets.images.alignLeft,
                            width: 30.w,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          'Hello ${BlocProvider.of<AuthCubit>(context).userName}',
                          style: AppTextStyles.displayLarge(context).copyWith(
                              fontWeight: FontWeight.bold, fontSize: 32.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Deals of the day',
                          style: AppTextStyles.displayMedium(context),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'see all',
                            style: AppTextStyles.displaySmall(context)
                                .copyWith(color: AppColors.tertiary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(24)),
                      child: CustomCursorSlider(),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Newest products',
                      style: AppTextStyles.displayMedium(context),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                  child:
                      ProductsGridBuilder(products: MyHomeCubit.productsList)),
            ],
          );
        },
      ),
    );
  }
}
