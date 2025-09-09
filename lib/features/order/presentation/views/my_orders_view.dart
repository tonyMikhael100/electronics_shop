import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/home/presentation/views/empty_cart_view.dart';
import 'package:electronics_shop/features/order/data/models/order_item_model.dart';
import 'package:electronics_shop/features/order/data/models/order_model.dart';
import 'package:electronics_shop/features/order/presentation/view%20model/order_cubit.dart';
import 'package:electronics_shop/features/order/presentation/widgets/order_details_list_tile.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:electronics_shop/features/order/data/models/order_with_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  @override
  void initState() {
    super.initState();
    final userId = BlocProvider.of<AuthCubit>(context).userId;
    context.read<OrderCubit>().getOrdersWithProductDetails(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: SafeArea(
          child: CustomAppBar(
            title: 'My Orders',
            onTap: () => context.pop(),
            widget: const Icon(Icons.keyboard_arrow_right_rounded),
            showBackButton: true,
            showDeleteButton: false,
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.secondary,
        color: AppColors.accent,
        onRefresh: () async {
          final userId = BlocProvider.of<AuthCubit>(context).userId;
          context.read<OrderCubit>().getOrdersWithProductDetails(userId);
        },
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return buildLoadingSkeltonizer();
            } else if (state is OrderWithItemsLoaded) {
              if (state.orders.isEmpty) {
                return NotFoundWidget(title: 'No Orders Yet!');
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    final orderWithItems = state.orders[index];
                    return OrderDetailsContainer(order: orderWithItems);
                  },
                ),
              );
            } else if (state is OrderError) {
              return Center(
                  child: Text(
                'An error occur, check your internet connection',
                style: AppTextStyles.bodyMedium(context),
              ));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Skeletonizer buildLoadingSkeltonizer() {
    return Skeletonizer(
        enabled: true,
        child: OrderDetailsContainer(
            order: OrderWithItems(
                order:
                    OrderModel(userId: 'dumy', addressId: 'dumy', total: 123),
                items: [
              OrderItemModel(
                  orderId: 'dumy',
                  productId: 'dumy',
                  quantity: 1,
                  unitPrice: 123),
              OrderItemModel(
                  orderId: 'dumy',
                  productId: 'dumy',
                  quantity: 1,
                  unitPrice: 123)
            ])));
  }
}

class OrderDetailsContainer extends StatelessWidget {
  final OrderWithItems order;

  const OrderDetailsContainer({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
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
          // ✅ Order status row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: AppTextStyles.displaySmall(context)
                    .copyWith(fontSize: 16.sp),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 255, 203, 209),
                ),
                child: Text(
                  order.order.status ?? 'Pending',
                  style: AppTextStyles.displaySmall(context).copyWith(
                    fontSize: 16.sp,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '#${order.order.id}',
            style: AppTextStyles.displaySmall(context)
                .copyWith(color: Colors.black38),
          ),
          const Divider(),

          ...order.items.map(
            (item) => OrderDetailsListTile(
              title: item.product?.name ?? 'Unknown',
              price: item.unitPrice,
              quantity: item.quantity,
              imageUrl: item.product?.imageUrl,
            ),
          ),

          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total :',
                style: AppTextStyles.displaySmall(context)
                    .copyWith(fontSize: 16.sp),
              ),
              Text(
                '${order.order.total} KWD',
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
