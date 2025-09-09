import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_category_model.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/category_cubit.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/not_found_widget.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:electronics_shop/widgets/products_gird_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({
    super.key,
    required this.productCategoryModel,
  });

  final ProductCategoryModel productCategoryModel;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool sortByLowest = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryCubit>(context).fetchAllProductByNameAndFilter(
      tableName: 'products',
      categoryName: widget.productCategoryModel.categoryName,
      columnName: 'price',
      ascending: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: SafeArea(
          child: CustomAppBar(
            title:
                widget.productCategoryModel.categoryName, // ✅ عنوان الكاتيجوري
            onTap: () {
              context.pop();
            },
            widget: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return loadingDummyData();
            } else if (state is CategoryFailureState) {
              return NotFoundWidget(title: state.errorMessage.toString());
            } else if (state is CategoryLoadedState) {
              final products = state.products;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            l10n.sortBy,
                                            style: AppTextStyles.displayMedium(
                                                context),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            context.pop();
                                            sortByLowest = false;
                                            await BlocProvider.of<
                                                    CategoryCubit>(context)
                                                .fetchAllProductByNameAndFilter(
                                                    tableName: 'products',
                                                    categoryName: widget
                                                        .productCategoryModel
                                                        .categoryName,
                                                    columnName: 'price',
                                                    ascending: false);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.keyboard_arrow_up_rounded,
                                                size: 40.sp,
                                              ),
                                              Text(
                                                l10n.highestToLowest,
                                                style: AppTextStyles
                                                        .displaySmall(context)
                                                    .copyWith(fontSize: 20.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            context.pop();
                                            sortByLowest = true;
                                            await BlocProvider.of<
                                                    CategoryCubit>(context)
                                                .fetchAllProductByNameAndFilter(
                                                    tableName: 'products',
                                                    categoryName: widget
                                                        .productCategoryModel
                                                        .categoryName,
                                                    columnName: 'price',
                                                    ascending: true);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                size: 40.sp,
                                              ),
                                              Text(
                                                l10n.lowestToHighest,
                                                style: AppTextStyles
                                                        .displaySmall(context)
                                                    .copyWith(fontSize: 20.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.keyboard_arrow_down_rounded),
                                Text(
                                  l10n.price,
                                  style: AppTextStyles.bodyMedium(context)
                                      .copyWith(
                                    color: AppColors.accent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${products.length} ${l10n.products}',
                          style: AppTextStyles.bodyMedium(context).copyWith(
                            color: AppColors.tertiary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              l10n.sortedBy,
                              style: AppTextStyles.bodyMedium(context).copyWith(
                                color: AppColors.tertiary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              sortByLowest
                                  ? l10n.lowestPrice
                                  : l10n.highestPrice,
                              style: AppTextStyles.bodyMedium(context).copyWith(
                                color: AppColors.accent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ProductsGridBuilder(products: products),
                  ],
                ),
              );
            } else {
              return const SizedBox(); // fallback if unknown state
            }
          },
        ),
      ),
    );
  }

  Skeletonizer loadingDummyData() {
    return Skeletonizer(
      enabled: true,
      child: ProductsGridBuilder(products: [
        ProductModel(
            id: ' dummy dummy',
            productCategory: 'dummy dummy',
            name: 'dummy dummy ',
            description: 'dummy dummy',
            price: 123,
            imageUrl:
                'https://nclsdhzpcxkiizuunell.supabase.co/storage/v1/object/public/images/fff.png',
            status: 'dummy'),
      ]),
    );
  }
}
