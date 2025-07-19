import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, List<CartModel>>> getAllCart({
    required String tableName,
    required String userId,
  });
  Future<Either<Failure, void>> addToCart(
      {required tableName, required CartModel cartModel});
  Future<Either<Failure, void>> deleteFromCart({
    required tableName,
    required String userId,
  });
}
