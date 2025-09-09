import 'package:dartz/dartz.dart';
import 'package:electronics_shop/core/errors/failure.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/search/data/repo/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final SupabaseService supabaseService = SupabaseService();
  @override
  Future<Either<Failure, List<ProductModel>>> searchProduct(
      {required String searchKey}) async {
    List<ProductModel> products = [];

    try {
      var response = await supabaseService.searchByName(
          table: 'products', searchKey: searchKey);
      for (int i = 0; i < response.length; i++) {
        products.add(ProductModel.fromJson(response[i]));
      }
      print(products);
      return Right(products);
    } on SupabaseFailure catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
