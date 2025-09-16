import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/address_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/delivery_cubit.dart';
import 'package:electronics_shop/features/order/data/models/order_model.dart';
import 'package:electronics_shop/features/order/presentation/view%20model/order_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/views/address_details_view.dart';
import 'package:electronics_shop/features/checkout/presentation/views/payment_view.dart';
import 'package:electronics_shop/features/checkout/presentation/views/review_products_view.dart';
import 'package:electronics_shop/features/home/presentation/views/complete_payment.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartProducts});

  final List<CartModel> cartProducts;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _streetController = TextEditingController();
  final _buildingController = TextEditingController();
  final _floorController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authCubit = BlocProvider.of<AuthCubit>(context);
    BlocProvider.of<AddressCubit>(context)
        .getAddresses(userId: authCubit.userId);
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _floorController.dispose();
    _apartmentController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final myAddressCubit = context.watch<AddressCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(
          title: l10n.checkout,
          showBackButton: _tabController.index > 2 ? false : true,
          onTap: () {
            context.pop();
          },
          widget: const Icon(Icons.keyboard_arrow_left_rounded),
        ),
      ),
      body: Column(
        children: [
          IgnorePointer(
            ignoring: true,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: l10n.address),
                Tab(text: l10n.review),
                Tab(text: l10n.payment),
                Tab(text: l10n.completeOrder),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.accent,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(), // disable swipe
              children: [
                AddressDetailsView(),
                ReviewProductsView(),
                PaymentView(),
                CompletePayment(),
              ],
            ),
          ),
          // Back & Next Buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible:
                        (_tabController.index > 0 && _tabController.index < 3),
                    child: CustomElevatedButton(
                      label: 'back',
                      backgroundColor: AppColors.tertiary,
                      onTap: () {
                        if (_tabController.index > 0) {
                          _tabController.animateTo(_tabController.index - 1);
                        }
                      },
                      width: 1.sw / 4,
                      icon: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _tabController.index < 3,
                    child: CustomElevatedButton(
                      label: _tabController.index > 1 ? 'Place Order' : 'Next',
                      backgroundColor: AppColors.accent,
                      onTap: () async {
                        final hasAddresses =
                            myAddressCubit.currentAddresses.isNotEmpty;
                        final selectedIndex = myAddressCubit.selectedAddress;
                        if (_tabController.index == 0) {
                          if (hasAddresses &&
                              selectedIndex >= 0 &&
                              selectedIndex <
                                  myAddressCubit.currentAddresses.length) {
                            _tabController.animateTo(1);
                          } else {
                            MyToast.showMyToast(context,
                                icon: Icons.cancel_rounded,
                                title: 'Please Select address or add one first',
                                bgColor: Colors.redAccent);
                          }
                        } else if (_tabController.index == 1) {
                          _tabController.animateTo(2); // review → payment
                        } else if (_tabController.index == 2) {
                          await placeOrderMethod(context);
                        } else if (_tabController.index == 3) {
                          _tabController.animateTo(4);
                        }
                      },
                      width: 1.sw / 4,
                      icon: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> placeOrderMethod(BuildContext context) async {

    final myOrderCubit = BlocProvider.of<OrderCubit>(context);
    final myAuthCubit = BlocProvider.of<AuthCubit>(context);
    final myAddressCubit = BlocProvider.of<AddressCubit>(context);
    final myCartCubit = BlocProvider.of<CartCubit>(context);
    final myDeliveryCubit = BlocProvider.of<DeliveryCubit>(context);
    await myOrderCubit.placeOrder(
      orderModel: OrderModel(
        userId: myAuthCubit.userId,
        addressId:
            myAddressCubit.currentAddresses[myAddressCubit.selectedAddress].id!,
        total: myCartCubit.total + myDeliveryCubit.deliveryCost.toInt(),
      ),
    );
    //delete all cart after place order
    myCartCubit.deleteAllCart();
    _tabController.animateTo(3);
  }
}
