import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCategoryRow extends StatelessWidget {
  const SearchCategoryRow({
    super.key,
    required this.categoryLabel,
    required this.imageUrl,
  });

  final String categoryLabel;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: 80.w,
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(24)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              categoryLabel,
              style: AppTextStyles.displayMedium(context)
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Divider(),
      ],
    );
  }
}
