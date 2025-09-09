part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchDoneState extends SearchState {
  final List<ProductModel> products;

  SearchDoneState({required this.products});
}

final class SearchNotFoundState extends SearchState {
  final String errorMessage;

  SearchNotFoundState({required this.errorMessage});
}
