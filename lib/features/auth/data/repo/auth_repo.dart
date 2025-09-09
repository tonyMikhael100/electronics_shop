import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, dynamic>> signUp({required UserModel userModel});
  Future<Either<Failure, dynamic>> signIn(
      {required String email, required String password});
}
