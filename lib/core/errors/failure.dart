import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.errorMessage});

  factory FirebaseFailure.fromFirebaseAuthException(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return FirebaseFailure(
            errorMessage: "The email address is badly formatted.");
      case 'user-disabled':
        return FirebaseFailure(errorMessage: "This user has been disabled.");
      case 'user-not-found':
        return FirebaseFailure(errorMessage: "No user found for that email.");
      case 'wrong-password':
        return FirebaseFailure(errorMessage: "Wrong password provided.");
      case 'email-already-in-use':
        return FirebaseFailure(
            errorMessage: "The account already exists for that email.");
      case 'operation-not-allowed':
        return FirebaseFailure(
            errorMessage: "Operation not allowed. Please contact support.");
      case 'weak-password':
        return FirebaseFailure(
            errorMessage: "The password provided is too weak.");
      case 'too-many-requests':
        return FirebaseFailure(
            errorMessage: "Too many requests. Try again later.");
      default:
        return FirebaseFailure(
            errorMessage: exception.message ?? "An unknown error occurred.");
    }
  }
}
