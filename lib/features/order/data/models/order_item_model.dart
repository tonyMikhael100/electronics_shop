class OrderItemModel {
  final String? id;
  final String orderId;
  final String productId;
  final int quantity;
  final double unitPirce;

  OrderItemModel({
    this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.unitPirce,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      unitPirce: json['unit_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'product_id': productId,
      'quantity': quantity,
      'unit_price': unitPirce,
    };
  }
}
