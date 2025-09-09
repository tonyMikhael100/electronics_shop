part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeBannerFailureState extends HomeState {
  final String errorMessage;

  HomeBannerFailureState({required this.errorMessage});
}

// categories

final class HomeCategoryFailureState extends HomeState {
  final String errorMessage;

  HomeCategoryFailureState({required this.errorMessage});
}

//

final class HomeProductFailureState extends HomeState {
  final String errorMessage;

  HomeProductFailureState({required this.errorMessage});
}

final class HomeDataLoadedState extends HomeState {}
