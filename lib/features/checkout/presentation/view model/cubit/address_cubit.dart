import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/checkout/data/models/address_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/address_repo_imp.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  final AddressRepoImp addressRepoImp = AddressRepoImp();

  int selectedAddress = -1;
  List<AddressModel> currentAddresses = [];

  void changeSelectedAddress(int index) {
    selectedAddress = index;
    emit(AddressSelectedSuccess(selectedIndex: index));
  }

  // 1. Add Address
  Future<void> addAddress({required AddressModel addressModel}) async {
    emit(AddressLoading());
    final response = await addressRepoImp.insertAddress(address: addressModel);
    response.fold(
        (failure) => emit(AddressFailure(errorMessage: failure.errorMessage)),
        (_) {
      emit(AddressSuccess(message: 'Address added!'));
    });
  }
//2-get all addresses

  Future<void> getAddresses({required String userId}) async {
    emit(AddressLoading());
    final response = await addressRepoImp.getAddresses(userId: userId);
    response.fold(
      (failure) => emit(AddressFailure(errorMessage: failure.errorMessage)),
      (addresses) {
        currentAddresses = addresses;
        emit(AddressListSuccess(addresses: addresses));
      },
    );
  }

  // 3. Update Address
  Future<void> updateAddress({
    required String addressId,
    required AddressModel updatedAddress,
  }) async {
    emit(AddressLoading());
    final response = await addressRepoImp.updateAddress(
      addressId: addressId,
      updatedAddress: updatedAddress,
    );
    response.fold(
      (failure) => emit(AddressFailure(errorMessage: failure.errorMessage)),
      (_) => emit(AddressSuccess(message: 'Address Updated!')),
    );
  }

  // 4. Delete Address
  Future<void> deleteAddress({required String addressId}) async {
    emit(AddressLoading());
    final response = await addressRepoImp.deleteAddress(addressId: addressId);
    response.fold(
        (failure) => emit(AddressFailure(errorMessage: failure.errorMessage)),
        (_) {
      selectedAddress = -1;
      emit(AddressSuccess(message: 'Address Deleted!'));
    });
  }
}
