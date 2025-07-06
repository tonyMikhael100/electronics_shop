class WhishlistModel {
  final String id;
  final String userId;
  final String productId;

  WhishlistModel({
    required this.id,
    required this.userId,
    required this.productId,
  });

  factory WhishlistModel.fromJson({required Map<String, dynamic> data}) {
    return WhishlistModel(
      id: data['id'],
      userId: data['user_id'],
      productId: data['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': productId,
    };
  }
}
