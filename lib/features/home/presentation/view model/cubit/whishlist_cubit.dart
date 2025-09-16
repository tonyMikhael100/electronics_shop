
import 'package:bloc/bloc.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/repo/home_repo_imp.dart';
import 'package:meta/meta.dart';
part 'whishlist_state.dart';

class WhishlistCubit extends Cubit<WhishlistState> {
  WhishlistCubit() : super(WhishlistInitial());

  final HomeRepoImp homeRepoImp = HomeRepoImp();
  final SupabaseService supabaseService = SupabaseService();

  bool isInWhishlist = false;
  List<ProductModel> products = [];

  Future<void> addToWhishlist({
    required String tableName,
    required Map<String, dynamic> whishlistData,
    required ProductModel product,
  }) async {
    final response = await homeRepoImp.addToWhishlist(
      tableName: tableName,
      whishlistData: whishlistData,
    );

    response.fold(
      (failure) {
        emit(FailureWhishlitState(
            errorMessage: 'This product was added before!'));
      },
      (_) {
        products.add(product);
        emit(AddWhishlistState());
        emit(FetchWhishlitState());
      },
    );
  }

  Future<void> removeFromWishlist({
    required String tableName,
    required String userId,
    required String productId,
  }) async {
    await supabaseService.deleteFromWishlist(
      table: tableName,
      userId: userId,
      productId: productId,
    );

    // ✅ احذف المنتج محليًا
    products.removeWhere((item) => item.id == productId);
    emit(FetchWhishlitState());
  }

  Future<void> toggleWhishlist({
    required String tableName,
    required String userId,
    required String productId,
    required ProductModel product,
  }) async {
    isInWhishlist = !isInWhishlist;
    emit(WhishlistStatusChanged(isInWishlist: isInWhishlist));

    if (isInWhishlist) {
      // Add
      await supabaseService.insertToWhishlist(
        table: tableName,
        values: {
          'user_id': userId,
          'product_id': productId,
        },
      );
      products.add(product);
    } else {
      // Remove
      await supabaseService.deleteFromWishlist(
        table: tableName,
        userId: userId,
        productId: productId,
      );
      products.removeWhere((p) => p.id == productId);
    }

    emit(AddWhishlistState());
    emit(FetchWhishlitState());
  }

  Future<void> fetchWhishlist({required String tableName}) async {
    emit(WhishlistLoadingState());
    var response = await homeRepoImp.fetchWishlist(tableName: tableName);

    response.fold(
      (failure) {
        emit(FailureWhishlitState(errorMessage: failure.errorMessage));
      },
      (fetchedProducts) {
        products = fetchedProducts;
        emit(FetchWhishlitState());
      },
    );
  }

  Future<void> checkIfInWhishlist({
    required String tableName,
    required String userId,
    required String productId,
  }) async {
    try {
      final exists = await supabaseService.isProductInWishlist(
        table: tableName,
        userId: userId,
        productId: productId,
      );
      isInWhishlist = exists;
      emit(WhishlistStatusChanged(isInWishlist: isInWhishlist));
    } catch (e) {

    }
  }
}
