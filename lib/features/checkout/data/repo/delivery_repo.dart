import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/checkout/data/models/delivery_model.dart';

abstract class DeliveryRepo {
  Future<Either<Failure, List<DeliveryModel>>> getAllDelivery({
    required String tableName,
  });

  Future<Either<Failure, double>> getDeliveryCostByAddressId(
      {required String addressId});
}
