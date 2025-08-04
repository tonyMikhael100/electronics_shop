import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/order/data/models/order_item_model.dart';
import 'package:electronics_shop/features/order/data/models/order_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, String>> insertOrder({required OrderModel orderModel});

  Future<Either<Failure, void>> insertOrderItem(
      {required String orderId, // pass orderId directly!
      required List<OrderItemModel> orderItems});
}
