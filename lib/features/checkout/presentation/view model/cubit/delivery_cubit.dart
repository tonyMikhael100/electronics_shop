import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/checkout/data/models/delivery_model.dart';
import 'package:electronics_shop/features/checkout/data/repo/address_repo_imp.dart';
import 'package:electronics_shop/features/checkout/data/repo/delivery_repo_imp.dart';
import 'package:meta/meta.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(DeliveryInitial());

  final DeliveryRepoImp deliveryRepoImp = DeliveryRepoImp();

  List<DeliveryModel> deliveryList = [];

  double deliveryCost = 0;

  Future<void> getAllDelivery({required tableName}) async {
    emit(DeliveryLoadingState());
    var response = await deliveryRepoImp.getAllDelivery(tableName: tableName);
    response.fold(
      (failure) {
        emit(DeliveryFailureState(failureMessage: failure.errorMessage));
      },
      (deliveryList) {
        this.deliveryList = deliveryList;
        emit(DeliverySuccessState(deliveryList: deliveryList));
      },
    );
  }

  getDeliveryCostByAddressId({required addressId}) async {
    emit(DeliveryCostLoadingState());
    var response =
        await deliveryRepoImp.getDeliveryCostByAddressId(addressId: addressId);

    response.fold(
      (failure) {
        emit(DeliveryCostFailureState(errorMessage: failure.errorMessage));
      },
      (deliveryCost) {
        this.deliveryCost = deliveryCost;
        emit(DeliveryCostSuccessState(deliveryCost: deliveryCost));
      },
    );
  }
}
