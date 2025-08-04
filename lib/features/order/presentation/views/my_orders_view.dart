import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/order/presentation/widgets/order_details_list_tile.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          title: 'My orders',
          onTap: () {
            context.pop();
          },
          widget: Icon(Icons.keyboard_arrow_right_rounded),
          showBackButton: true,
          showDeleteButton: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              OrderDetailsContainer(),
              OrderDetailsContainer(),
              OrderDetailsContainer(),
              OrderDetailsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'status',
                style: AppTextStyles.displaySmall(context)
                    .copyWith(fontSize: 16.sp),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 255, 203, 209),
                ),
                child: Text(
                  'Pending',
                  style: AppTextStyles.displaySmall(context).copyWith(
                    fontSize: 16.sp,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '#522b29b6-0f8f-4148-89bc-eb0cd6f27ef5',
            style: AppTextStyles.displaySmall(context)
                .copyWith(color: Colors.black38),
          ),
          Divider(),
          OrderDetailsListTile(),
          OrderDetailsListTile(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total amount:',
                style: AppTextStyles.displaySmall(context)
                    .copyWith(fontSize: 16.sp),
              ),
              Text(
                '\$799',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyMedium(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
