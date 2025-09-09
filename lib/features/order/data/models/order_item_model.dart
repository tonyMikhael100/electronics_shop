import 'package:electronics_shop/features/home/data/models/product_item_model.dart';

class OrderItemModel {
  final String orderId;
  final String productId;
  final int quantity;
  final int unitPrice;
  final ProductModel? product;

  OrderItemModel({
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    this.product,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      orderId: json['order_id'],
      productId: json['product_id'],
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toInt(),
      product: json['products'] != null
          ? ProductModel.fromJson(json['products'])
          : null,
    );
  }
}
