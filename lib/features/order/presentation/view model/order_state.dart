part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {}

class OrderError extends OrderState {
  final String errorMessage;
  OrderError(this.errorMessage);
}

class OrderWithItemsLoaded extends OrderState {
  final List<OrderWithItems> orders;
  OrderWithItemsLoaded(this.orders);
}
