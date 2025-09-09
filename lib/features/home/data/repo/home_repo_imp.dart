import 'dart:io'; // 👈 مهم
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
  Future<Either<Failure, List<BannerModel>>> fetchBanners({
    required String tableName,
  }) async {
    try {
      final response = await supabaseService.getAll(table: tableName);
      final banners = response.map((e) => BannerModel.fromJson(e)).toList();
      return Right(banners);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductCategoryModel>>> fetchCategories({
    required String tableName,
  }) async {
    try {
      final response = await supabaseService.getAll(table: tableName);
      final categories =
          response.map((e) => ProductCategoryModel.fromJson(e)).toList();
      return Right(categories);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchNewestProducts({
    required String tableName,
  }) async {
    try {
      final response =
          await supabaseService.getNewestProducts(table: tableName);
      final products = response.map((e) => ProductModel.fromJson(e)).toList();
      return Right(products);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
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
      final response = await supabaseService.insertToWhishlist(
        table: tableName,
        values: whishlistData,
      );
      return Right(response);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
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
    try {
      final response =
          await supabaseService.fetchUserWishlist(table: tableName);
      final products = response
          .map<ProductModel>((e) => ProductModel.fromJson(e['products']))
          .toList();
      return Right(products);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
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
      final response = await supabaseService.getAllFiltered(
        categoryName: categoryName,
        tableName: tableName,
        columnName: columnName,
        ascending: ascending,
      );
      final products = response.map((e) => ProductModel.fromJson(e)).toList();
      return Right(products);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseFailure(errorMessage: e.toString()));
    }
  }
}
