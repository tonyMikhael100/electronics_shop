
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/checkout/data/models/address_model.dart';
import 'package:electronics_shop/features/checkout/data/models/delivery_model.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/address_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/delivery_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/custom_address_text_form_field.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/delivery_row_select.dart';
import 'package:electronics_shop/widgets/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddressFormColumn extends StatefulWidget {
  const AddressFormColumn({super.key});

  @override
  State<AddressFormColumn> createState() => _AddressFormColumnState();
}

class _AddressFormColumnState extends State<AddressFormColumn> {
  final TextEditingController streetController = TextEditingController();

  final TextEditingController buildingController = TextEditingController();

  final TextEditingController floorController = TextEditingController();

  final TextEditingController apartmentController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<DeliveryCubit>().getAllDelivery(tableName: 'delivery');
  }

  int selectedDeliveryIndex = -1;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddressCubit>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    width: 1.sw / 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add address',
                      style: AppTextStyles.displayMedium(context),
                    ),
                    CustomSmallButton(
                      icon: Icons.cancel,
                      bgColor: Colors.grey.shade300,
                      iconColor: AppColors.accent,
                      onTap: () {
                        context.pop();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomAddressTextFormField(
                  controller: streetController,
                  hintText: 'Street',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Street is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomAddressTextFormField(
                  controller: buildingController,
                  hintText: 'Building',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Building is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomAddressTextFormField(
                  controller: floorController,
                  hintText: 'Floor',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Floor is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomAddressTextFormField(
                  controller: apartmentController,
                  hintText: 'Apartment',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Apartment is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<DeliveryCubit, DeliveryState>(
                  builder: (context, state) {
                    if (state is DeliveryLoadingState) {
                      return loadingDelivery();
                    } else if (state is DeliverySuccessState) {

                      return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.deliveryList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 3 / 1),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedDeliveryIndex = index;
                                });
                              },
                              child: DeliveryRowSelect(
                                isSelected: selectedDeliveryIndex == index,
                                deliveryModel: DeliveryModel(
                                    id: 'id',
                                    deliveryZone:
                                        state.deliveryList[index].deliveryZone,
                                    deliveryCost:
                                        state.deliveryList[index].deliveryCost),
                              ),
                            );
                          });
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                const SizedBox(height: 16),
                CustomAddressTextFormField(
                  controller: countryController,
                  hintText: 'Country',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Country is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.tertiary,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          'Cancel',
                          style: AppTextStyles.displaySmall(context).copyWith(
                              color: AppColors.accent, fontSize: 16.sp),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (selectedDeliveryIndex != -1) {
                          if (_formKey.currentState!.validate()) {
                            final authCubit =
                                BlocProvider.of<AuthCubit>(context);
                            final addressModel = AddressModel(
                              id: '',
                              deliveryId: context
                                  .read<DeliveryCubit>()
                                  .deliveryList[selectedDeliveryIndex]
                                  .id
                                  .toString(),
                              userId: authCubit.userId,
                              street: streetController.text,
                              building: buildingController.text,
                              floor: floorController.text,
                              apartment: apartmentController.text,
                              city: context
                                  .read<DeliveryCubit>()
                                  .deliveryList[selectedDeliveryIndex]
                                  .deliveryZone,
                              country: countryController.text,
                            );
                            await cubit.addAddress(addressModel: addressModel);
                            await cubit.getAddresses(userId: authCubit.userId);
                            context.pop(); // ترجع بعد الإضافة
                          }
                        } else {
                          MyToast.showMyToast(context,
                              icon: Icons.error,
                              title: 'Please Select Delivery zone first',
                              bgColor: Colors.redAccent);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          'Add',
                          style: AppTextStyles.displaySmall(context).copyWith(
                              color: AppColors.primary, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Skeletonizer loadingDelivery() {
    return Skeletonizer(
      child: DeliveryRowSelect(
          deliveryModel:
              DeliveryModel(id: 'id', deliveryZone: 'dummy', deliveryCost: 100),
          isSelected: false),
    );
  }
}
