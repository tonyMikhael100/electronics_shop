class ProductCategoryModel {
  final String id;
  final String categoryName;
  final String imageUrl;

  ProductCategoryModel({
    required this.id,
    required this.categoryName,
    required this.imageUrl,
  });
  factory ProductCategoryModel.fromJson(Map<String, dynamic> data) {
    return ProductCategoryModel(
      id: data['id'],
      categoryName: data['name'],
      imageUrl: data['image_url'],
    );
  }
}
