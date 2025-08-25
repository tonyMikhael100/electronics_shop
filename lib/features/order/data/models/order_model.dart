class OrderModel {
  final String? id;
  final String userId;
  final String addressId;
  final String? status;
  final int total;

  OrderModel(
      {this.id,
      required this.userId,
      required this.addressId,
      this.status,
      required this.total});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['user_id'],
      addressId: json['address_id'],
      status: json['status'],
      total: (json['total'] as num).toInt(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'address_id': addressId,
      'status': status,
      'total': total,
    };
  }
}
