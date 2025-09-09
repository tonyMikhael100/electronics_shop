part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {
  final String message;
  AddressSuccess({required this.message});
}

class AddressFailure extends AddressState {
  final String errorMessage;
  AddressFailure({required this.errorMessage});
}

class AddressListSuccess extends AddressState {
  final List<AddressModel> addresses;
  AddressListSuccess({required this.addresses});
}

class AddressSelectedSuccess extends AddressState {
  final int selectedIndex;
  AddressSelectedSuccess({required this.selectedIndex});
}
