import 'package:electronics_shop/features/home/data/models/product_item_model.dart';

class CartModel {
  final String id;
  final String userId;
  final ProductModel product;
  final int quantity;

  CartModel({
    required this.id,
    required this.userId,
    required this.product,
    required this.quantity,
  });

  int get totalPrice => product.price * quantity;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['user_id'],
      product: ProductModel(
        id: json['product_id'],
        productCategory: json['category_name'],
        name: json['name'],
        description: json['description'],
        price: (json['price'] as num).toInt(),
        imageUrl: json['image_url'],
        status: json['status'],
      ),
      quantity: (json['quantity'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': product.id,
      'category_name': product.productCategory,
      'name': product.name,
      'description': product.description,
      'price': product.price,
      'image_url': product.imageUrl,
      'status': product.status,
      'quantity': quantity,
    };
  }
}
