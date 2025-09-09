part of 'whishlist_cubit.dart';

@immutable
sealed class WhishlistState {}

final class WhishlistInitial extends WhishlistState {}

// whishlist
final class AddWhishlistState extends WhishlistState {}

final class WhishlistLoadingState extends WhishlistState {}

final class FetchWhishlitState extends WhishlistState {}

final class FailureWhishlitState extends WhishlistState {
  final String errorMessage;

  FailureWhishlitState({required this.errorMessage});
}

final class WhishlistStatusChanged extends WhishlistState {
  final bool isInWishlist;

  WhishlistStatusChanged({required this.isInWishlist});
}
