import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsListTile extends StatelessWidget {
  final String title;
  final int price;
  final int quantity;
  final String? imageUrl;

  const OrderDetailsListTile({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.secondary,
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '', // fallback to empty if null
            width: 50,
            height: 50,
            fit: BoxFit.contain,
            placeholder: (context, url) =>
                const CircularProgressIndicator(strokeWidth: 1),
            errorWidget: (context, url, error) => const Icon(Icons.image),
          ),
        ),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          'Quantity: $quantity',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium(context).copyWith(
            fontSize: 14.sp,
            color: Colors.black45,
          ),
        ),
        trailing: Text(
          '${(price * quantity).toStringAsFixed(2)} KWD',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
