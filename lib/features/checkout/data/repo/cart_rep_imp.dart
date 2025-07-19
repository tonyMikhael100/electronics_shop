import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/cart_repo.dart';

class CartRepImp implements CartRepo {
  final SupabaseService supabaseService = SupabaseService();

  @override
  Future<Either<Failure, List<CartModel>>> getAllCart(
      {required String tableName, required String userId}) async {
    List<CartModel> cartList = [];
    try {
      var response = await supabaseService.getAllWithQuery(
          table: tableName, columnName: 'user_id', columnValue: userId);
      for (int i = 0; i < response.length; i++) {
        var item = CartModel.fromJson(response[i]);
        cartList.add(item);
      }
      print(cartList);
      return Right(cartList);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.errorMessage.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(
      {required tableName, required CartModel cartModel}) async {
    try {
      await supabaseService.insert(table: 'cart', value: cartModel.toJson());

      return Right('insesrted');
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.errorMessage.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFromCart({
    required tableName,
    required String userId,
  }) async {
    try {
      var response = await supabaseService.deleteAllCart(
        tableName: tableName,
        userId: userId,
      );
      return Right('Item Deleted !');
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.errorMessage.toString()));
    }
  }
}
