import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/cart_rep_imp.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final CartRepImp cartRepImp = CartRepImp();
  Future<void> getAllCart({
    required String tableName,
  }) async {
    emit(CartLoadingState());
    final user = await AuthCubit().getUserData();
    var response = await cartRepImp.getAllCart(
        tableName: tableName, userId: user[0]['id']);
    response.fold((failure) {
      emit(CartFailureState(errorMessage: failure.errorMessage));
    }, (cartList) {
      emit(CartSuccessState(cartList: cartList));
    });
  }

  Future<void> addToCart(
      {required String tableName, required CartModel cartModel}) async {
    // Ensure id is set (generate if empty)
    final CartModel modelWithId = cartModel.id.isEmpty
        ? CartModel(
            id: const Uuid().v4(),
            userId: cartModel.userId,
            product: cartModel.product,
            quantity: cartModel.quantity,
          )
        : cartModel;
    var response = await cartRepImp.addToCart(
        tableName: tableName, cartModel: modelWithId);

    response.fold((failure) {
      emit(CartInsertFailureState(message: failure.errorMessage.toString()));
    }, (successMessage) {
      emit(CartInsertState(
        message: 'Added To Cart',
      ));
    });
  }

  Future<void> deleteAllCart() async {
    emit(CartDeleteLoadingState());

    final user = await AuthCubit().getUserData();

    var response = await cartRepImp.deleteFromCart(
        tableName: 'cart', userId: user[0]['id']);

    response.fold((failure) {
      emit(CartDeleteFailureState(message: failure.errorMessage.toString()));
    }, (successMessage) {
      refreshCart();
      print('refreshhedd');
      emit(CartDeleteState(message: 'Items Deleted!'));
    });
  }

  Future<void> incrementQuantity(CartModel cartModel) async {
    if (state is CartSuccessState) {
      final currentList =
          List<CartModel>.from((state as CartSuccessState).cartList);
      final index = currentList.indexWhere((item) => item.id == cartModel.id);
      if (index != -1) {
        emit(CartQuantityLoadingState());
        final updatedCart = CartModel(
          id: cartModel.id,
          userId: cartModel.userId,
          product: cartModel.product,
          quantity: cartModel.quantity + 1,
        );
        currentList[index] = updatedCart;
        emit(CartSuccessState(cartList: currentList));
        final result = await cartRepImp.updateCartQuantity(
            id: cartModel.id, quantity: updatedCart.quantity);
        result.fold(
          (failure) {
            // Revert on failure
            currentList[index] = cartModel;
            emit(CartFailureState(errorMessage: failure.errorMessage));
            emit(CartSuccessState(cartList: currentList));
          },
          (success) {},
        );
      }
    }
  }

  Future<void> decrementQuantity(CartModel cartModel) async {
    if (cartModel.quantity > 1 && state is CartSuccessState) {
      final currentList =
          List<CartModel>.from((state as CartSuccessState).cartList);
      final index = currentList.indexWhere((item) => item.id == cartModel.id);
      if (index != -1) {
        emit(CartQuantityLoadingState());
        final updatedCart = CartModel(
          id: cartModel.id,
          userId: cartModel.userId,
          product: cartModel.product,
          quantity: cartModel.quantity - 1,
        );
        currentList[index] = updatedCart;
        emit(CartSuccessState(cartList: currentList));
        final result = await cartRepImp.updateCartQuantity(
            id: cartModel.id, quantity: updatedCart.quantity);
        result.fold(
          (failure) {
            // Revert on failure
            currentList[index] = cartModel;
            emit(CartFailureState(errorMessage: failure.errorMessage));
            emit(CartSuccessState(cartList: currentList));
          },
          (success) {},
        );
      }
    }
  }

  Future<void> deleteCartItem(CartModel cartModel) async {
    // Implement the logic to delete a single cart item from Supabase
    emit(CartLoadingState());
    final user = await AuthCubit().getUserData();
    await cartRepImp.deleteSingleCartItem(
      tableName: 'cart',
      userId: user[0]['id'],
      cartItemId: cartModel.id,
    );
    getAllCart(tableName: 'cart');
  }

  void refreshCart() {
    emit(CartLoadingState());
    getAllCart(tableName: 'cart');
    emit(CartInitial());
  }
}
