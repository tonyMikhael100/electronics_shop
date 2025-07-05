import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/banner_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCursorSlider extends StatelessWidget {
  const CustomCursorSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeBannerFailureState) {
          return Center(
              child: Text(
            'An error occur',
            style: AppTextStyles.bodyMedium(context)
                .copyWith(color: Colors.redAccent),
          ));
        } else if (state is HomeBannerSuccessState) {
          final List banners = state.bannerList;
          return CarouselSlider(
              options: CarouselOptions(
                  height: 1.sw > 800 ? 500.h : null,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(seconds: 3)),
              items: banners.map<Widget>((banner) {
                return Image.network(
                  banner.imageUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                );
              }).toList());
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }
      },
    );
  }
}
