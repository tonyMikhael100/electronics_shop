import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());
  int selectedIndex = 0;
  String selectedPaymentMethod = 'cod';
  int selectedPaymentIndex = 0;
  void selectPaymentMethod({required String method, required int index}) {
    selectedPaymentMethod = method;
    selectedPaymentIndex = index;
    print(selectedPaymentMethod);
    emit(ChangePaymentMethodState());
  }

  void selectAddress(int index) {
    selectedIndex = index;
    print(selectedIndex);
    emit(ChangeIndexState());
  }
}
