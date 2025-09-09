import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.errorMessage});

  factory FirebaseFailure.fromFirebaseAuthException(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case 'Invalid-Email':
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
      case 'network-request-failed':
        return FirebaseFailure(errorMessage: "No Internet Connection");
      case 'invalid-credential':
        return FirebaseFailure(errorMessage: "email or password is incorrect");
      case 'invalid-email':
        return FirebaseFailure(errorMessage: "Invalid Email");
      case 'invalid-verification-code':
        return FirebaseFailure(errorMessage: "Invalid Verification Code");
      case 'invalid-verification-id':
        return FirebaseFailure(errorMessage: "Invalid Verification ID");

      default:
        return FirebaseFailure(
            errorMessage: exception.message ?? "An unknown error occurred.");
    }
  }
}

class SupabaseFailure extends Failure {
  SupabaseFailure({required super.errorMessage});
  factory SupabaseFailure.fromPostgrestException(PostgrestException exception) {
    switch (exception.code) {
      case 'PGRST116':
        return SupabaseFailure(
            errorMessage: "Your session has expired. Please log in again.");
      case '42501':
        return SupabaseFailure(
            errorMessage: "You do not have permission to perform this action.");
      case '23505':
        return SupabaseFailure(
            errorMessage:
                "This information already exists. Please use different values.");
      case '23503':
        return SupabaseFailure(
            errorMessage: "Some related information is missing or invalid.");
      case '23502':
        return SupabaseFailure(
            errorMessage:
                "A required field is missing. Please fill in all fields.");
      case '22P02':
        return SupabaseFailure(
            errorMessage:
                "Some information is in the wrong format. Please check your input.");
      case '42883':
        return SupabaseFailure(
            errorMessage:
                "A required function is unavailable. Please contact support.");
      case '42P01':
        return SupabaseFailure(
            errorMessage:
                "A required resource is missing. Please contact support.");
      case '40001':
        return SupabaseFailure(
            errorMessage: "A temporary error occurred. Please try again.");
      case 'PGRST102':
        return SupabaseFailure(
            errorMessage: "Your session has expired. Please log in again.");
      case 'PGRST301':
        return SupabaseFailure(
            errorMessage:
                "Some required information is missing. Please try again.");
      default:
        return SupabaseFailure(
          errorMessage:
              "Something went wrong. Please try again or contact support.",
        );
    }
  }
}
