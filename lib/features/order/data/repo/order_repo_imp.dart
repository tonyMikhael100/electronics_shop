import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/order/data/models/order_item_model.dart';
import 'package:electronics_shop/features/order/data/models/order_model.dart';
import 'package:electronics_shop/features/order/data/models/order_with_item_model.dart';
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

  @override
  Future<Either<Failure, List<OrderModel>>> getAllOrders(
      {required String userId}) async {
    List<OrderModel> orders = [];
    try {
      var response = await supabaseService.getAllWithQuery(
          table: 'orders', columnName: 'user_id', columnValue: userId);
      for (int i = 0; i < response.length; i++) {
        orders.add(OrderModel.fromJson(response[i]));
      }
      return Right(orders);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderWithItems>>> getOrdersWithItems({
    required String userId,
  }) async {
    try {
      final ordersResult = await getAllOrders(userId: userId);
      if (ordersResult.isLeft()) {
        return Left(ordersResult
            .swap()
            .getOrElse(() => Failure(errorMessage: 'Unknown error')));
      }
      final orders = ordersResult.getOrElse(() => []);
      List<OrderWithItems> result = [];
      for (final order in orders) {
        final itemResponse = await supabaseService.getAllWithQuery(
          table: 'order_items',
          columnName: 'order_id',
          columnValue: order.id!,
        );

        final items =
            itemResponse.map((json) => OrderItemModel.fromJson(json)).toList();

        result.add(OrderWithItems(order: order, items: items));
      }

      return Right(result);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderWithItems>>> getOrdersWithItemsAndProducts({
    required String userId,
  }) async {
    try {
      final response =
          await supabaseService.getOrdersWithItemsAndProducts(userId: userId);

      final result = response.map<OrderWithItems>((orderJson) {
        final order = OrderModel.fromJson(orderJson);
        final orderItemsJson = orderJson['order_items'] as List<dynamic>? ?? [];

        final items = orderItemsJson.map<OrderItemModel>((itemJson) {
          return OrderItemModel.fromJson(itemJson);
        }).toList();

        return OrderWithItems(order: order, items: items);
      }).toList();
      return Right(result);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
