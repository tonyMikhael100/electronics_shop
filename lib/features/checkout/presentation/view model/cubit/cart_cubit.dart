import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/cart_rep_imp.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  int total = 0;
  final CartRepImp cartRepImp = CartRepImp();
  List<CartModel> currentCartList = [];

  Future<void> getAllCart({required String tableName}) async {
    emit(CartLoadingState());

    try {
      final user = await AuthCubit().getUserData();

      final response = await cartRepImp.getAllCart(
        tableName: tableName,
        userId: user[0]['id'],
      );
      response.fold(
        (failure) => emit(CartFailureState(errorMessage: failure.errorMessage)),
        (cartList) {
          currentCartList = cartList;
          calculateTotalAmount();
          emit(CartSuccessState(cartList: cartList));
        },
      );
    } on SocketException {
      emit(CartFailureState(errorMessage: "No Internet Connection"));
    }
  }

  Future<void> addToCart({
    required String tableName,
    required CartModel cartModel,
  }) async {
    final CartModel modelWithId = cartModel.id.isEmpty
        ? CartModel(
            id: const Uuid().v4(),
            userId: cartModel.userId,
            product: cartModel.product,
            quantity: cartModel.quantity,
          )
        : cartModel;

    final response = await cartRepImp.addToCart(
      tableName: tableName,
      cartModel: modelWithId,
    );

    response.fold(
      (failure) => emit(CartInsertFailureState(message: failure.errorMessage)),
      (_) => emit(CartInsertState(message: 'Added To Cart')),
    );
  }

  Future<void> deleteAllCart() async {
    emit(CartDeleteLoadingState());

    final user = await AuthCubit().getUserData();

    final response = await cartRepImp.deleteFromCart(
      tableName: 'cart',
      userId: user[0]['id'],
    );

    response.fold(
      (failure) => emit(CartDeleteFailureState(message: failure.errorMessage)),
      (_) async {
        await getAllCart(tableName: 'cart');
        emit(CartDeleteState(message: 'Items Deleted!'));
      },
    );
  }

  Future<void> deleteCartItem(CartModel cartModel) async {
    emit(CartLoadingState());

    final user = await AuthCubit().getUserData();

    await cartRepImp.deleteSingleCartItem(
      tableName: 'cart',
      userId: user[0]['id'],
      cartItemId: cartModel.id,
    );

    await getAllCart(tableName: 'cart');
  }

  Future<void> incrementQuantity(CartModel cartModel) async {
    if (state is CartSuccessState) {
      emit(CartQuantityLoadingState());

      final updatedQuantity = cartModel.quantity + 1;

      final result = await cartRepImp.updateCartQuantity(
        id: cartModel.id,
        quantity: updatedQuantity,
      );

      result.fold(
        (failure) => emit(CartFailureState(errorMessage: failure.errorMessage)),
        (_) async => await getAllCart(tableName: 'cart'),
      );
    }
  }

  Future<void> decrementQuantity(CartModel cartModel) async {
    if (cartModel.quantity > 1 && state is CartSuccessState) {
      emit(CartQuantityLoadingState());

      final updatedQuantity = cartModel.quantity - 1;

      final result = await cartRepImp.updateCartQuantity(
        id: cartModel.id,
        quantity: updatedQuantity,
      );

      result.fold(
        (failure) => emit(CartFailureState(errorMessage: failure.errorMessage)),
        (_) async => await getAllCart(tableName: 'cart'),
      );
    }
  }

  void refreshCart() {
    emit(CartLoadingState());
    getAllCart(tableName: 'cart');
    emit(CartInitial());
  }

  void calculateTotalAmount() {
    total = 0;
    for (var item in currentCartList) {
      total += item.product.price * item.quantity;
    }
  }
}
