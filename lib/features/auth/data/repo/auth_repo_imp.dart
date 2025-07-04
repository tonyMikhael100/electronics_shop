import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/auth_service.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/auth/data/models/user_model.dart';
import 'package:electronics_shop/features/auth/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImp implements AuthRepo {
  AuthService _authService = AuthService();
  SupabaseService _supabaseService = SupabaseService();
  @override
  Future<Either<Failure, dynamic>> signIn(
      {required String email, required String password}) async {
    try {
      var response =
          await _authService.signInWithEmail(email: email, password: password);
      return Right(response);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(Failure(errorMessage: 'Unknown error: $e'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signUp(
      {required UserModel userModel}) async {
    try {
      var response = await _authService.signUpWithEmail(
          email: userModel.email, password: userModel.password);
      try {
        await _supabaseService.insert(table: 'users', values: {
          "name": userModel.fullName,
          "email": userModel.email,
          "password": userModel.password,
          "phone": userModel.phone
        });
      } catch (e) {
        return Left(Failure(errorMessage: 'Supabase insert failed: $e'));
      }
      return Right(response);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(Failure(errorMessage: 'Unknown error: $e'));
    }
  }
}
