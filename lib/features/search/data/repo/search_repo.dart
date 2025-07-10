import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductModel>>> searchProduct({
    required String searchKey,
  });
}
