import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryGridBuilder extends StatelessWidget {
  const CategoryGridBuilder({
    super.key,
    required this.myHomeCubit,
  });

  final HomeCubit myHomeCubit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: myHomeCubit.categoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final category = myHomeCubit.categoryList[index];
        return InkWell(
          onTap: () {
            context.push('/category_view', extra: category);
            // myHomeCubit.categoryList[index].categoryName
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: category.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  category.categoryName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.displaySmall(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
