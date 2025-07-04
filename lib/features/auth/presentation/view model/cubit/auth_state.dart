part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthFailureState extends AuthState {
  final String errorMessage;

  AuthFailureState({required this.errorMessage});
}

final class AuthSuccessState extends AuthState {
  final String successMessage;

  AuthSuccessState({required this.successMessage});
}

final class LoginLoadingState extends AuthState {}

final class LoginFailuregState extends AuthState {
  final String errorMessage;

  LoginFailuregState({required this.errorMessage});
}

final class LoginSuccessState extends AuthState {}
