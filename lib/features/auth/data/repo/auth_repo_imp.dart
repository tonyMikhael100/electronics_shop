import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/features/auth/data/repo/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
