import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/cart_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartRepImp implements CartRepo {
  final SupabaseService supabaseService = SupabaseService();

  @override
  Future<Either<Failure, List<CartModel>>> getAllCart({
    required String tableName,
    required String userId,
  }) async {
    List<CartModel> cartList = [];
    try {
      var response = await supabaseService.getAllWithQuery(
        table: tableName,
        columnName: 'user_id',
        columnValue: userId,
      );
      for (int i = 0; i < response.length; i++) {
        var item = CartModel.fromJson(response[i]);
        cartList.add(item);
      }
      return Right(cartList);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart({
    required tableName,
    required CartModel cartModel,
  }) async {
    try {
      var existing = await supabaseService.getAllWithQuery(
        table: tableName,
        columnName: 'user_id',
        columnValue: cartModel.userId,
      );

      final match = existing.firstWhere(
        (item) => item['product_id'] == cartModel.product.id,
        orElse: () => <String, dynamic>{},
      );

      if (match.isNotEmpty) {
        final newQuantity = match['quantity'] + cartModel.quantity;
        await supabaseService.update(
          table: tableName,
          values: {'quantity': newQuantity},
          matchColumn: 'id',
          matchValue: match['id'],
        );
      } else {
        await supabaseService.insert(table: 'cart', value: cartModel.toJson());
      }
      return Right(null);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartQuantity({
    required String id,
    required int quantity,
  }) async {
    try {
      await supabaseService.update(
        table: 'cart',
        values: {'quantity': quantity},
        matchColumn: 'id',
        matchValue: id,
      );
      return Right(null);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFromCart({
    required tableName,
    required String userId,
  }) async {
    try {
      await supabaseService.deleteAllCart(
        tableName: tableName,
        userId: userId,
      );
      return Right(null);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteSingleCartItem({
    required String tableName,
    required String userId,
    required String cartItemId,
  }) async {
    try {
      await supabaseService.deleteSingleCartItem(
        tableName: tableName,
        userId: userId,
        cartItemId: cartItemId,
      );
      return Right(null);
    } on SocketException {
      return Left(Failure(errorMessage: "No Internet Connection"));
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
