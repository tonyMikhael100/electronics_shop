import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> signUp(
      {required String email, required String password});
  Future<Either<Failure, Map<String, dynamic>>> signIn();
}
