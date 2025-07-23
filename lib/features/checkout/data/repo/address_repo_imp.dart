import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/checkout/data/models/address_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/address_repo.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddressRepoImp implements AddressRepo {
  final SupabaseService supabaseService = SupabaseService();

  static const _table = 'address';

  @override
  Future<Either<Failure, void>> insertAddress(
      {required AddressModel address}) async {
    try {
      await supabaseService.insert(
        table: _table,
        value: {
          'user_id': address.userId,
          'street': address.street,
          'building': address.building,
          'floor': address.floor,
          'apartment': address.apartment,
          'city': address.city,
          'country': address.country,
        },
      );
      return const Right(null);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AddressModel>>> getAddresses(
      {required String userId}) async {
    try {
      final result = await supabaseService.getAllWithQuery(
        table: _table,
        columnName: 'user_id',
        columnValue: userId,
      );

      final addresses = result.map((e) => AddressModel.fromJson(e)).toList();

      return Right(addresses);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAddress({
    required String addressId,
    required AddressModel updatedAddress,
  }) async {
    try {
      await supabaseService.update(
        table: _table,
        values: updatedAddress.toJson(),
        matchColumn: 'id',
        matchValue: addressId,
      );
      return const Right(null);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(
      {required String addressId}) async {
    try {
      await supabaseService.delete(tableName: _table, id: addressId);
      return const Right(null);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
