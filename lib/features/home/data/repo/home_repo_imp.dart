import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/home/data/models/banner_model.dart';
import 'package:electronics_shop/features/home/data/models/product_category_model.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final SupabaseService supabaseService = SupabaseService();
  @override
  Future<Either<Failure, List<BannerModel>>> fetchBanners(
      {required String tableName}) async {
    List<BannerModel> banners = [];
    try {
      var response = await supabaseService.getAll(table: tableName);
      for (int i = 0; i < response.length; i++) {
        var item = BannerModel.fromJson(response[i]);
        banners.add(item);
      }
      return Right(banners);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductCategoryModel>>> fetchCategories(
      {required String tableName}) async {
    List<ProductCategoryModel> categories = [];
    try {
      var response = await supabaseService.getAll(table: tableName);
      for (int i = 0; i < response.length; i++) {
        var item = ProductCategoryModel.fromJson(response[i]);
        categories.add(item);
      }
      return Right(categories);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts(
      {required String tableName}) async {
    List<ProductModel> products = [];
    try {
      var response = await supabaseService.getAll(table: tableName);
      for (int i = 0; i < response.length; i++) {
        var item = ProductModel.fromJson(response[i]);
        products.add(item);
      }
      return Right(products);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }
}
