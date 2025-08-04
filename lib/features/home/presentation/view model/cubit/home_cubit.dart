import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/home/data/models/banner_model.dart';
import 'package:electronics_shop/features/home/data/models/product_category_model.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/repo/home_repo_imp.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeRepoImp homeRepoImp = HomeRepoImp();

  List<BannerModel> bannersList = [];
  List<ProductCategoryModel> categoryList = [];
  List<ProductModel> productsList = [];

  Future<void> fetchBanners({required String tableName}) async {
    var response = await homeRepoImp.fetchBanners(tableName: tableName);
    print(response);
    response.fold((filure) {
      emit(HomeBannerFailureState(errorMessage: 'An error occur'));
    }, (banners) {
      bannersList = banners;
      emit(HomeDataLoadedState());
    });
  }

  Future<void> fetchCategories({required String tableName}) async {
    var response = await homeRepoImp.fetchCategories(tableName: tableName);
    print(response);
    response.fold(
      (failure) {
        emit(HomeCategoryFailureState(errorMessage: 'An error occur'));
      },
      (categories) {
        categoryList = categories;
        emit(HomeDataLoadedState());
      },
    );
  }

  Future<void> fetchProducts({required String tableName}) async {
    var response = await homeRepoImp.fetchProducts(tableName: tableName);
    print(response);
    response.fold(
      (failure) {
        emit(HomeProductFailureState(errorMessage: 'An error occur'));
      },
      (products) {
        productsList = products;
        emit(HomeDataLoadedState());
      },
    );
  }
}
