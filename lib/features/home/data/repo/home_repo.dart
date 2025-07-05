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
  Future<Either<Failure, List<ProductModel>>> fetchProducts(
      {required String tableName});
}
