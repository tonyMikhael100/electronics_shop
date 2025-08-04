import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/checkout/data/models/address_model.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/address_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/custom_address_text_form_field.dart';
import 'package:electronics_shop/widgets/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddressFormColumn extends StatelessWidget {
  AddressFormColumn({super.key});

  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                CustomAddressTextFormField(
                  controller: cityController,
                  hintText: 'City',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'City is required';
                    }
                    return null;
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
                        if (_formKey.currentState!.validate()) {
                          final authCubit = BlocProvider.of<AuthCubit>(context);
                          final addressModel = AddressModel(
                            id: '',
                            userId: authCubit.userId,
                            street: streetController.text,
                            building: buildingController.text,
                            floor: floorController.text,
                            apartment: apartmentController.text,
                            city: cityController.text,
                            country: countryController.text,
                          );
                          await cubit.addAddress(addressModel: addressModel);
                          await cubit.getAddresses(userId: authCubit.userId);
                          context.pop(); // ترجع بعد الإضافة
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
}
