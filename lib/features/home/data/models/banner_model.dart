class BannerModel {
  final int id;
  final String imageUrl;
  final String goToView;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.goToView,
  });

  factory BannerModel.fromJson(Map<String, dynamic> data) {
    return BannerModel(
        id: data['id'],
        imageUrl: data['image_url'],
        goToView: data['go_to_view']);
  }
}
