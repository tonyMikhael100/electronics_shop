part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeBannerFailureState extends HomeState {
  final String errorMessage;

  HomeBannerFailureState({required this.errorMessage});
}

final class HomeBannerLoadingState extends HomeState {}

final class HomeBannerSuccessState extends HomeState {
  final List<BannerModel> bannerList;

  HomeBannerSuccessState({required this.bannerList});
}
