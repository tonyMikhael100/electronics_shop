import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/features/search/presentation/view%20model/cubit/cubit/search_cubit.dart';
import 'package:electronics_shop/features/search/presentation/widgets/search_category_row.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:electronics_shop/widgets/custom_text_filed.dart';
import 'package:electronics_shop/widgets/not_found_widget.dart';
import 'package:electronics_shop/widgets/products_gird_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    var myHomeCubit = BlocProvider.of<HomeCubit>(context);
    var mySeachCubit = BlocProvider.of<SearchCubit>(context);
    return Column(
      children: [
        CustomTextFiled(
          label: l10n.searchLabel,
          onChanged: (value) {
            mySeachCubit.clearSearch();
            if (value.isEmpty || value == '') {
              mySeachCubit.clearSearch();
            }
            mySeachCubit.searchProduct(searchKey: value);
          },
          suffixIcon: Icons.search,
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return ListView.builder(
                  itemCount: myHomeCubit.categoryList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.push('/category_view',
                            extra: myHomeCubit.categoryList[index]);
                      },
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
                    child: ProductsGridBuilder(products: [
                      ProductModel(
                          id: 'id',
                          productCategory: "productCategory",
                          name: "name",
                          description: "description",
                          price: 1000,
                          imageUrl: "https://dummyimage.com/600x400/000/fff",
                          status: "status"),
                      ProductModel(
                          id: 'id',
                          productCategory: "productCategory",
                          name: "name",
                          description: "description",
                          price: 1000,
                          imageUrl:
                              "https://nclsdhzpcxkiizuunell.supabase.co/storage/v1/object/public/images//fff.png",
                          status: "status"),
                    ]));
              } else if (state is SearchNotFoundState) {
                return NotFoundWidget(
                  title: l10n.oopsNotFound,
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
