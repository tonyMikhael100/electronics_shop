import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/order/data/models/order_item_model.dart';
import 'package:electronics_shop/features/order/data/models/order_model.dart';
import 'package:electronics_shop/features/order/data/repo/order_repo.dart';

class OrderRepoImp implements OrderRepo {
  final SupabaseService supabaseService = SupabaseService();

  @override
  Future<Either<Failure, String>> insertOrder(
      {required OrderModel orderModel}) async {
    try {
      final response = await supabaseService.insertOrder(
          userId: orderModel.userId,
          addressId: orderModel.addressId,
          total: orderModel.total);
      return Right(response);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> insertOrderItem({
    required String orderId, // pass orderId directly!
    required List<OrderItemModel> orderItems,
  }) async {
    try {
      for (final item in orderItems) {
        await supabaseService.insertOrderItem(
          orderId: orderId,
          productId: item.productId,
          quantity: item.quantity,
          unitPrice: item.unitPirce,
        );
      }
      return const Right(null);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
