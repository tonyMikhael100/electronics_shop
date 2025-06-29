import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/apis/api_services.dart';
import 'package:electronics_shop/features/auth/data/repo/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  ApiServices apiServices = ApiServices();

  @override
  Future<Either<Failure, Map<String, dynamic>>> signIn() async {
    return right({});
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp(
      {required String email, required String password}) async {
    try {
      print('Sending signup request...');
      var data = await apiServices.postRequest(
        endPoint: 'InsertUser.php',
        body: {
          'email': email,
          'password': password,
        },
      );
      print('Signup response: $data');
      return right(data);
    } on DioException catch (e) {
      print('Signup failed: ${e.message}');
      return left(ServerFailure.toDioException(e));
    }
  }
}
