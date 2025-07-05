class ProductCategoryModel {
  final String categoryName;
  final String imageUrl;

  ProductCategoryModel({
    required this.categoryName,
    required this.imageUrl,
  });
  factory ProductCategoryModel.fromJson(Map<String, dynamic> data) {
    return ProductCategoryModel(
        categoryName: data['name'], imageUrl: data['image_url']);
  }
}
