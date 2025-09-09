import 'package:electronics_shop/features/order/data/models/order_item_model.dart';
import 'package:electronics_shop/features/order/data/models/order_model.dart';

class OrderWithItems {
  final OrderModel order;
  final List<OrderItemModel> items;

  OrderWithItems({required this.order, required this.items});
}
