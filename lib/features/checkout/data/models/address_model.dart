class AddressModel {
  final String? id;
  final String userId;
  final String deliveryId;
  final String street;
  final String building;
  final String floor;
  final String apartment;
  final String city;
  final String country;

  AddressModel({
    required this.id,
    required this.userId,
    required this.deliveryId,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.city,
    required this.country,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      deliveryId: json['delivery_id'] as String,
      street: json['street'] as String,
      building: json['building'] as String,
      floor: json['floor'] as String,
      apartment: json['apartment'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'delivery_id': deliveryId,
      'street': street,
      'building': building,
      'floor': floor,
      'apartment': apartment,
      'city': city,
      'country': country,
    };
  }
}
