part of 'check_out_cubit.dart';

@immutable
sealed class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}

final class CheckOutLoadingState extends CheckOutState {}

final class CheckOutSuccess extends CheckOutState {}

final class EmptyAddressState extends CheckOutState {}

final class ChangeIndexState extends CheckOutState {}

final class ChangePaymentMethodState extends CheckOutState {}
