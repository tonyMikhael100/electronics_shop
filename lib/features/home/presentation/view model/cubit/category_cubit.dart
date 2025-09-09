import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/repo/home_repo_imp.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  HomeRepoImp homeRepoImp = HomeRepoImp();
  List<ProductModel> productsList = [];

  Future<void> fetchAllProductByNameAndFilter({
    required String tableName,
    required String categoryName,
    required String columnName,
    required bool ascending,
  }) async {
    emit(CategoryLoadingState());
    var response = await homeRepoImp.fetchFilteredProducts(
      tableName: tableName,
      categoryName: categoryName,
      columnName: columnName,
      ascending: ascending,
    );
    response.fold((failure) {
      emit(CategoryFailureState(errorMessage: failure.errorMessage));
    }, (products) {
      if (products.isEmpty) {
        emit(
            CategoryFailureState(errorMessage: 'no products in this category'));
      } else {
        productsList = products;
        emit(CategoryLoadedState(products: products));
      }
    });
  }
}
