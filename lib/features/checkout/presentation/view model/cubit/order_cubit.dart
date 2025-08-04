import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/checkout/data/models/order_item_model.dart';
import 'package:electronics_shop/features/checkout/data/models/order_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/order_repo.dart';
import 'package:electronics_shop/features/checkout/data/repo/order_repo_imp.dart';
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
    print(cartList);

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
            unitPirce: item.product.price.toDouble(),
          );
        }).toList();
        var response = await orderRepoImp.insertOrderItem(
          orderId: orderId, // ✅ pass orderId
          orderItems: orderItems,
        );
        response.fold(
          (failure) => emit(OrderError(failure.errorMessage)),
          (_) => emit(OrderSuccess()),
        );
      },
    );
  }
}
