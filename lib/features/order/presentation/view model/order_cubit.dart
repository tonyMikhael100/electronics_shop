import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/order/data/models/order_item_model.dart';
import 'package:electronics_shop/features/order/data/models/order_model.dart';
import 'package:electronics_shop/features/order/data/models/order_with_item_model.dart';
import 'package:electronics_shop/features/order/data/repo/order_repo_imp.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final CartCubit cartCubit;
  final OrderRepoImp orderRepoImp;

  OrderCubit({
    required this.cartCubit,
    required this.orderRepoImp,
  }) : super(OrderInitial());

  Future<void> placeOrder({required OrderModel orderModel}) async {
    emit(OrderLoading());
    var cartList = cartCubit.currentCartList;

    var orderResult = await orderRepoImp.insertOrder(orderModel: orderModel);

    orderResult.fold(
      (orderFailure) {
        emit(OrderError(orderFailure.errorMessage));
      },
      (orderId) async {
        List<OrderItemModel> orderItems = cartList.map((item) {
          return OrderItemModel(
            orderId: orderId,
            productId: item.product.id,
            quantity: item.quantity,
            unitPrice: item.product.price,
          );
        }).toList();

        var response = await orderRepoImp.insertOrderItem(
          orderId: orderId,
          orderItems: orderItems,
        );

        response.fold(
          (failure) => emit(OrderError(failure.errorMessage)),
          (_) => emit(OrderSuccess()),
        );
      },
    );
  }

  // ✅ Get orders with items only
  Future<void> getOrdersWithItems({required String userId}) async {
    emit(OrderLoading());
    final result = await orderRepoImp.getOrdersWithItems(userId: userId);
    result.fold(
      (failure) => emit(OrderError(failure.errorMessage)),
      (ordersWithItems) => emit(OrderWithItemsLoaded(ordersWithItems)),
    );
  }

  // ✅ Get orders with item + product details
  Future<void> getOrdersWithProductDetails(String userId) async {
    emit(OrderLoading());
    final result =
        await orderRepoImp.getOrdersWithItemsAndProducts(userId: userId);
    result.fold(
      (failure) => emit(OrderError(failure.errorMessage)),
      (ordersWithItems) =>
          emit(OrderWithItemsLoaded(ordersWithItems)), // ✅ reuse same state
    );
  }
}
