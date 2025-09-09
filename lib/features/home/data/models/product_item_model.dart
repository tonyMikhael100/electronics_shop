class ProductModel {
  final String id;
  final String productCategory;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final String status;

  ProductModel({
    required this.id,
    required this.productCategory,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      productCategory: data['product_category'],
      name: data['name'],
      description: data['description'],
      price: (data['price'] as num).toInt(),
      imageUrl: data['image_url'],
      status: data['status'],
    );
  }
}
