import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/cart_rep_imp.dart';
import 'package:meta/meta.dart';

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
    var response =
        await cartRepImp.addToCart(tableName: tableName, cartModel: cartModel);

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

  void refreshCart() {
    emit(CartLoadingState());
    getAllCart(tableName: 'cart');
    emit(CartInitial());
  }
}
