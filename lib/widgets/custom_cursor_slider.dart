import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/home/data/models/banner_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCursorSlider extends StatelessWidget {
  const CustomCursorSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myHomeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeBannerFailureState) {
          return Center(
            child: Column(
              children: [
                Text(
                  'No intenet connection',
                  style: AppTextStyles.displayMedium(context)
                      .copyWith(color: Colors.redAccent),
                ),
                TextButton(
                  onPressed: () {
                    myHomeCubit.fetchBanners(tableName: 'banner');
                    myHomeCubit.fetchCategories(tableName: 'categories');
                    myHomeCubit.fetchProducts(tableName: 'products');
                    context.read<AuthCubit>().getUserData();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Try again',
                      style: AppTextStyles.bodyMedium(context)
                          .copyWith(color: Colors.white)),
                )
              ],
            ),
          );
        } else if (state is HomeDataLoadedState) {
          final List banners = myHomeCubit.bannersList;
          return CarouselSlider(
              options: CarouselOptions(
                  height:
                      MediaQuery.sizeOf(context).width > 600 ? 600.h : 400.h,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(seconds: 3)),
              items: banners.map<Widget>((banner) {
                return CachedNetworkImage(
                  imageUrl: banner.imageUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                );
              }).toList());
        } else {
          return Skeletonizer(
            enabled: true,
            child: SizedBox(
              width: double.infinity,
              height: 200,
            ),
          );
        }
      },
    );
  }
}
