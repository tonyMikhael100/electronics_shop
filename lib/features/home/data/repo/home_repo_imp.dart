import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/home/data/models/banner_model.dart';
import 'package:electronics_shop/features/home/data/models/product_category_model.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/repo/home_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
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
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchNewestProducts(
      {required String tableName}) async {
    List<ProductModel> products = [];
    try {
      var response = await supabaseService.getNewestProducts(table: tableName);
      for (int i = 0; i < response.length; i++) {
        var item = ProductModel.fromJson(response[i]);
        products.add(item);
      }

      return Right(products);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToWhishlist({
    required String tableName,
    required Map<String, dynamic> whishlistData,
  }) async {
    try {
      var response = await supabaseService.insertToWhishlist(
        table: tableName,
        values: whishlistData,
      );
      return Right(response);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchWishlist({
    required String tableName,
  }) async {
    List<ProductModel> products = [];

    try {
      var response = await supabaseService.fetchUserWishlist(table: tableName);

      for (int i = 0; i < response.length; i++) {
        var item = response[i]['products']; // fixed this line
        products.add(ProductModel.fromJson(item));
      }

      return Right(products);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchFilteredProducts({
    required String tableName,
    required String categoryName,
    required String columnName,
    required bool ascending,
  }) async {
    try {
      List<ProductModel> filteredProducts = [];
      var response = await supabaseService.getAllFiltered(
          categoryName: categoryName,
          tableName: tableName,
          columnName: columnName,
          ascending: ascending);
      for (var product in response) {
        filteredProducts.add(ProductModel.fromJson(product));
      }
      return Right(filteredProducts);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
    }
  }
}
