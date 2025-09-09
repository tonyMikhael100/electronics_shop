import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductCategoryGridView extends StatelessWidget {
  const ProductCategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myHomeCubit = BlocProvider.of<HomeCubit>(context);
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeCategoryFailureState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.bodyMedium(context),
              ),
            );
          } else if (state is HomeDataLoadedState) {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: myHomeCubit.categoryList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push('/category');
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl: myHomeCubit.categoryList[index].imageUrl,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          myHomeCubit.categoryList[index].categoryName,
                          style: AppTextStyles.bodyMedium(context),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));
          }
        },
      ),
    );
  }
}
