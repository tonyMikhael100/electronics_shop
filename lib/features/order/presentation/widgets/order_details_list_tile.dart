import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsListTile extends StatelessWidget {
  const OrderDetailsListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.secondary,
          ),
          child: CachedNetworkImage(
            imageUrl:
                'https://nclsdhzpcxkiizuunell.supabase.co/storage/v1/object/public/images//iphone2.png',
          ),
        ),
        title: Text(
          'iphone 15 pro max',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium(context)
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w800),
        ),
        subtitle: Text(
          'Quantity: 2',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium(context)
              .copyWith(fontSize: 14.sp, color: Colors.black45),
        ),
        trailing: Text(
          '\$299',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium(context)
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
