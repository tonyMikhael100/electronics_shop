class DeliveryModel {
  final String id;
  final String deliveryZone;
  final double deliveryCost;

  DeliveryModel({
    required this.id,
    required this.deliveryZone,
    required this.deliveryCost,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
        id: json['id'],
        deliveryZone: json['delivery_zone'],
        deliveryCost: (json['delivery_cost'] as num).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'delivery_zone': deliveryZone,
      'delivery_cost': deliveryCost,
    };
  }
}
