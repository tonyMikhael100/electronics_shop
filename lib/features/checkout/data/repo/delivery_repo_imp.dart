import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/checkout/data/models/delivery_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/delivery_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeliveryRepoImp implements DeliveryRepo {
  final SupabaseService supabaseService = SupabaseService();
  @override
  Future<Either<Failure, List<DeliveryModel>>> getAllDelivery({
    required String tableName,
  }) async {
    try {
      List<DeliveryModel> delivery = [];
      var response = await supabaseService.getAll(table: tableName);
      for (int i = 0; i < response.length; i++) {
        delivery.add(DeliveryModel.fromJson(response[i]));
      }
      return Right(delivery);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } on SocketException {
      return Left(
          Failure(errorMessage: 'please check your internet and try again'));
    }
  }

  @override
  Future<Either<Failure, double>> getDeliveryCostByAddressId({
    required String addressId,
  }) async {
    try {
      // 1. Get the address row
      final addressRowResponse = await supabaseService.getAllWithQuery(
        table: 'address',
        columnName: 'id',
        columnValue: addressId,
      );

      if (addressRowResponse.isEmpty) {
        return Left(Failure(errorMessage: 'Address not found'));
      }

      final deliveryId = addressRowResponse[0]['delivery_id'];

      // 2. Get the delivery row using delivery_id
      final deliveryRowResponse = await supabaseService.getAllWithQuery(
        table: 'delivery',
        columnName: 'id',
        columnValue: deliveryId,
      );

      if (deliveryRowResponse.isEmpty) {
        return Left(Failure(errorMessage: 'Delivery not found'));
      }

      final cost = (deliveryRowResponse[0]['delivery_cost'] as num).toDouble();

      return Right(cost);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure.fromPostgrestException(e));
    } on SocketException {
      return Left(
        Failure(errorMessage: 'Please check your internet and try again'),
      );
    }
  }
}
