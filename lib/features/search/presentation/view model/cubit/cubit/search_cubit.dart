import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/search/data/repo/search_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final SearchRepoImp searchRepoImp = SearchRepoImp();
  final TextEditingController searchController = TextEditingController();

  void clearSearch() {
    emit(SearchInitial());
  }

  Future<void> searchProduct({required String searchKey}) async {
    if (searchKey.trim().isEmpty) {
      clearSearch(); // Shows categories
      return;
    }

    emit(SearchLoadingState());

    var response = await searchRepoImp.searchProduct(searchKey: searchKey);
    response.fold(
      (failure) {
        emit(SearchNotFoundState(errorMessage: failure.errorMessage));
      },
      (products) {
        if (products.isEmpty) {
          emit(SearchNotFoundState(errorMessage: "No results found"));
        } else {
          emit(SearchDoneState(products: products));
        }
      },
    );
  }
}
