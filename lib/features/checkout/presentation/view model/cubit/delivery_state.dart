part of 'delivery_cubit.dart';

@immutable
sealed class DeliveryState {}

final class DeliveryInitial extends DeliveryState {}

final class DeliverySuccessState extends DeliveryState {
  final List<DeliveryModel> deliveryList;

  DeliverySuccessState({required this.deliveryList});
}

final class DeliveryFailureState extends DeliveryState {
  final String failureMessage;

  DeliveryFailureState({required this.failureMessage});
}

final class DeliveryLoadingState extends DeliveryState {}

final class DeliveryCostLoadingState extends DeliveryState {}

final class DeliveryCostSuccessState extends DeliveryState {
  final double deliveryCost;

  DeliveryCostSuccessState({required this.deliveryCost});
}

final class DeliveryCostFailureState extends DeliveryState {
  final String errorMessage;

  DeliveryCostFailureState({required this.errorMessage});
}
