part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategoryLoadedState extends CategoryState {
  final List<ProductModel> products;

  CategoryLoadedState({required this.products});
}

final class CategoryFailureState extends CategoryState {
  final String errorMessage;

  CategoryFailureState({required this.errorMessage});
}
