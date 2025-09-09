import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/checkout/data/models/address_model.dart';

abstract class AddressRepo {
  Future<Either<Failure, void>> insertAddress({
    required AddressModel address,
  });

  Future<Either<Failure, List<AddressModel>>> getAddresses({
    required String userId,
  });

  Future<Either<Failure, void>> updateAddress({
    required String addressId,
    required AddressModel updatedAddress,
  });

  Future<Either<Failure, void>> deleteAddress({
    required String addressId,
  });
}
