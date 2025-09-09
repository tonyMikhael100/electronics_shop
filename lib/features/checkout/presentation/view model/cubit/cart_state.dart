part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccessState extends CartState {
  final List<CartModel> cartList;

  CartSuccessState({required this.cartList});
}

final class CartFailureState extends CartState {
  final String errorMessage;

  CartFailureState({required this.errorMessage});
}

final class CartEmptyState extends CartState {}

//insert

final class CartInsertState extends CartState {
  final String message;

  CartInsertState({required this.message});
}

final class CartInsertLoadingState extends CartState {}

final class CartInsertFailureState extends CartState {
  final String message;

  CartInsertFailureState({required this.message});
}

//delete
final class CartDeleteState extends CartState {
  final String message;

  CartDeleteState({required this.message});
}

final class CartDeleteLoadingState extends CartState {}

final class CartDeleteFailureState extends CartState {
  final String message;

  CartDeleteFailureState({required this.message});
}

class CartQuantityLoadingState extends CartState {}

class CartTotalPricetate extends CartState {}
