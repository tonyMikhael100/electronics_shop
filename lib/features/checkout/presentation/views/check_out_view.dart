import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/address_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/views/address_details_view.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:electronics_shop/widgets/custom_text_form_field.dart';
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

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    BlocProvider(create: (context) => AddressCubit());
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
    final myAddressCubit = context.watch<AddressCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(
          title: 'Checkout',
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
              tabs: const [
                Tab(text: 'Address'),
                Tab(text: 'Payment'),
                Tab(text: 'Review'),
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
                // Tab 1: Address Details
                AddressDetailsView(),
                // Tab 2: Payment Method
                const Center(
                  child: Text(
                    'Payment Method Selection (Pending)',
                    textAlign: TextAlign.center,
                  ),
                ),

                // Tab 3: Review
                const Center(
                  child: Text(
                    'Order Review Page',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // Back & Next Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _tabController.index > 0,
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
                  visible: _tabController.index < 2,
                  child: CustomElevatedButton(
                    label: 'next',
                    backgroundColor: AppColors.accent,
                    onTap: () {
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
                        _tabController.animateTo(2); // Payment → Review
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
        ],
      ),
    );
  }
}
