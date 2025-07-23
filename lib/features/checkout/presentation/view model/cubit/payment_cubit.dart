import 'package:bloc/bloc.dart';
import 'package:electronics_shop/features/checkout/data/models/payment_model.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  int selectedPayment = 0;
  List<PaymentModel> paymentMethods = [
    PaymentModel(
        paymentImage: Assets.images.cod,
        paymentMethod: 'Cash on delivery (COD)'),
    PaymentModel(paymentImage: Assets.images.visa, paymentMethod: 'Visa'),
    PaymentModel(
        paymentImage: Assets.images.paypal3SvgrepoCom, paymentMethod: 'paypal'),
  ];
  void changeSelectedPayment(int index) {
    selectedPayment = index;
    emit(PaymentSelectedChange());
  }
}
