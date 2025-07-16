import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.emptyBoxSvg,
            width: 150.w,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: AppTextStyles.bodyLarge(context),
          )
        ],
      ),
    );
  }
}
