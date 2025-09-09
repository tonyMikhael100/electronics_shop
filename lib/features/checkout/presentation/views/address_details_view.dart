import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/checkout/data/models/address_model.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/address_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/address_form_column.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/custom_address_container.dart';
import 'package:electronics_shop/widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final myAddressCubit = BlocProvider.of<AddressCubit>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          addNewButton(context),
          const SizedBox(height: 32),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              if (state is AddressLoading) {
                return loadingAddressContainer();
              } else if (state is AddressListSuccess ||
                  state is AddressSelectedSuccess) {
                final addresses = context.read<AddressCubit>().currentAddresses;
                if (addresses.isEmpty || state is AddressFailure) {
                  return NotFoundWidget(
                      title: 'No address added, please add one!');
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: addresses.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          myAddressCubit.changeSelectedAddress(index);
                        },
                        child: CustomAddressContainer(
                          addressModel: addresses[index],
                          isSelected: myAddressCubit.selectedAddress == index,
                          onTap: () {
                            final myAuthCubit =
                                BlocProvider.of<AuthCubit>(context);
                            myAddressCubit.deleteAddress(
                              addressId: addresses[index].id.toString(),
                            );
                            myAddressCubit.getAddresses(
                                userId: myAuthCubit.userId);
                          },
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  Skeletonizer loadingAddressContainer() {
    return Skeletonizer(
      enabled: true,
      child: CustomAddressContainer(
        addressModel: AddressModel(
          id: 'id',
          userId: 'userId',
          deliveryId: 'deliveryId',
          street: 'street',
          building: 'building',
          floor: 'floor',
          apartment: 'apartment',
          city: 'city',
          country: 'country',
        ),
        isSelected: false,
        onTap: () {},
      ),
    );
  }

  Row addNewButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (bottomSheetContext) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                  ),
                  child: AddressFormColumn(),
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.tertiary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'add new',
              style: AppTextStyles.displaySmall(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
