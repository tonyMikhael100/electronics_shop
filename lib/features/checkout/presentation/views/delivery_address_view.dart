import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/check_out_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/chekcout_stepper.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/delivery_to_container.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:electronics_shop/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_stepper/progress_stepper.dart';

class DeliveryAddressView extends StatelessWidget {
  const DeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomAppBar(
          title: 'Delivery Address',
          showActionButton: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckouStepper(
              isActiveOne: true,
              isActiveTwo: false,
              isActiveThree: false,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Delivery To ',
              style: AppTextStyles.displayMedium(context),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocConsumer<CheckOutCubit, CheckOutState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is CheckOutLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (state is EmptyAddressState) {
                    return Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/empty_box.svg',
                            width: 200.w,
                            height: 100,
                          ),
                          Text(
                            'No Address added yet',
                            style: AppTextStyles.displayMedium(context),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (cotext, index) {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<CheckOutCubit>(context)
                                .selectAddress(index);
                            // send the address of selected index;
                          },
                          child: DeliveryToContainer(
                            addressType: 'Home',
                            address: 'Elzaitoun bla bla ',
                            isSelected: BlocProvider.of<CheckOutCubit>(context)
                                    .selectedIndex ==
                                index,
                            // on press delte button
                            onPressedDelete: () {},
                            // on press edit button
                            onPressedEdit: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Edit Address',
                                          style: AppTextStyles.displayMedium(
                                              context),
                                        ),
                                        SizedBox(height: 16),
                                        CustomTextFiled(
                                          label: 'street address',
                                          onChanged: (value) {},
                                        ),
                                        CustomTextFiled(
                                          label: 'city',
                                          onChanged: (value) {},
                                        ),
                                        CustomTextFiled(
                                          label: 'billing address',
                                          onChanged: (value) {},
                                        ),
                                        SizedBox(height: 16),
                                        CustomElevatedButton(
                                          icon: Icons.done,
                                          label: 'Save',
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          onTap: () {
                                            // save edited address
                                            context.pop();
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            // add new address button
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Add New Address',
                            style: AppTextStyles.displayMedium(context),
                          ),
                          SizedBox(height: 16),
                          CustomTextFiled(
                            label: 'street address',
                            onChanged: (value) {},
                          ),
                          CustomTextFiled(
                            label: 'city',
                            onChanged: (value) {},
                          ),
                          CustomTextFiled(
                            label: 'billing address',
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 16),
                          CustomElevatedButton(
                            icon: Icons.done,
                            label: 'Save',
                            backgroundColor: AppColors.primaryColor,
                            onTap: () {
                              //save address
                              context.pop();
                            },
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      'Add New Address',
                      style: AppTextStyles.bodyLarge(context),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              icon: Icons.navigate_next_sharp,
              label: "Continue to payment",
              onTap: () {
                context.push('/payment');
              },
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
