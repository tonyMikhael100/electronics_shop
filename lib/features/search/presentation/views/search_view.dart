import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/features/search/presentation/view%20model/cubit/cubit/search_cubit.dart';
import 'package:electronics_shop/features/search/presentation/widgets/search_category_row.dart';
import 'package:electronics_shop/features/search/presentation/widgets/search_loading.dart';
import 'package:electronics_shop/widgets/custom_text_filed.dart';
import 'package:electronics_shop/widgets/filter_list_tile.dart';
import 'package:electronics_shop/widgets/product_item.dart';
import 'package:electronics_shop/widgets/products_gird_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var myHomeCubit = BlocProvider.of<HomeCubit>(context);
    var mySeachCubit = BlocProvider.of<SearchCubit>(context);
    return Column(
      children: [
        CustomTextFiled(
          label: "Search",
          onChanged: (value) {
            mySeachCubit.clearSearch();
            if (value.isEmpty || value == '') {
              mySeachCubit.clearSearch();
            }
            mySeachCubit.searchProduct(searchKey: value);
          },
          suffixIcon: Icons.search,
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return ListView.builder(
                  itemCount: myHomeCubit.categoryList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: SearchCategoryRow(
                        imageUrl: myHomeCubit.categoryList[index].imageUrl,
                        categoryLabel:
                            myHomeCubit.categoryList[index].categoryName,
                      ),
                    );
                  },
                );
              } else if (state is SearchLoadingState) {
                return Skeletonizer(
                  enabled: true,
                  child: ListView.builder(
                    itemCount: myHomeCubit.categoryList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: SearchCategoryRow(
                          imageUrl: myHomeCubit.categoryList[index].imageUrl,
                          categoryLabel:
                              myHomeCubit.categoryList[index].categoryName,
                        ),
                      );
                    },
                  ),
                );
              } else if (state is SearchNotFoundState) {
                return Center(
                  child: Text(
                    "No Product Found",
                    style: AppTextStyles.displayMedium(context),
                  ),
                );
              } else if (state is SearchDoneState) {
                return ProductsGridBuilder(products: state.products);
              } else {
                mySeachCubit.clearSearch();
                return SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
