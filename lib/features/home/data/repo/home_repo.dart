import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/home/data/models/banner_model.dart';
import 'package:electronics_shop/features/home/data/models/product_category_model.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BannerModel>>> fetchBanners(
      {required String tableName});
  Future<Either<Failure, List<ProductCategoryModel>>> fetchCategories(
      {required String tableName});
  Future<Either<Failure, List<ProductModel>>> fetchNewestProducts(
      {required String tableName});

  Future<Either<Failure, void>> addToWhishlist(
      {required String tableName, required Map<String, dynamic> whishlistData});

  Future<Either<Failure, List<ProductModel>>> fetchWishlist(
      {required String tableName});

  Future<Either<Failure, List<ProductModel>>> fetchFilteredProducts({
    required String tableName,
    required String categoryName,
    required String columnName,
    required bool ascending,
  });
}
