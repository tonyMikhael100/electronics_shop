import 'package:carousel_slider/carousel_slider.dart';
import 'package:electronics_shop/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCursorSlider extends StatelessWidget {
  const CustomCursorSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 400.h,
          aspectRatio: 16 / 9,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(seconds: 3)),
      items: [
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(color: Colors.amber),
            child: Text(
              'Test',
              style: AppTextStyles.bodyLarge(context),
            )),
      ],
    );
  }
}
