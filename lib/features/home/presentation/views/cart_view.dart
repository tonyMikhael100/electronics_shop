import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:electronics_shop/features/checkout/presentation/widgets/total_price_section.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/widgets/cart_item.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:electronics_shop/widgets/favourite_product_item.dart';
import 'package:electronics_shop/widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  void getUserDataAndCartData() async {
    BlocProvider.of<CartCubit>(context).getAllCart(
      tableName: 'cart',
    );
  }

  @override
  void initState() {
    getUserDataAndCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final isQuantityLoading = state is CartQuantityLoadingState;
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(56),
                child: CustomAppBar(
                  widget: Icon(Icons.delete),
                  showDeleteButton: true,
                  onTap: () async {
                    await BlocProvider.of<CartCubit>(context).deleteAllCart();
                  },
                  title: 'Cart',
                  showBackButton: false,
                ),
              ),
              body: RefreshIndicator(
                backgroundColor: AppColors.secondary,
                color: AppColors.tertiary,
                onRefresh: () async {
                  BlocProvider.of<CartCubit>(context).getAllCart(
                    tableName: 'cart',
                  );
                },
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartLoadingState) {
                      return buildDumyList();
                    } else if (state is CartFailureState) {
                      return Center(
                        child: NotFoundWidget(title: state.errorMessage),
                      );
                    } else if (state is CartSuccessState) {
                      if (state.cartList.isEmpty) {
                        return NotFoundWidget(title: 'Cart is Empty ! ');
                      }
                      return Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: state.cartList.length,
                                itemBuilder: (context, index) {
                                  final cart = state.cartList[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Slidable(
                                      endActionPane: ActionPane(
                                        motion: const DrawerMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) async {
                                              // Delete the cart item
                                              await BlocProvider.of<CartCubit>(
                                                      context)
                                                  .deleteCartItem(cart);
                                            },
                                            backgroundColor: Colors.redAccent,
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            label: 'Delete',
                                          ),
                                          SlidableAction(
                                            onPressed: (context) {
                                              final product = cart.product;
                                              final message =
                                                  '${product.name} for ${product.price} LE';
                                              SharePlus.instance
                                                  .share(ShareParams(
                                                title: 'Check out this product',
                                                text: message,
                                              ));
                                            },
                                            backgroundColor: AppColors.accent,
                                            foregroundColor: Colors.white,
                                            icon: Icons.share,
                                            label: 'Share',
                                          ),
                                        ],
                                      ),
                                      child: CartItem(
                                        cartModel: cart,
                                        onTapPlus: () =>
                                            BlocProvider.of<CartCubit>(context)
                                                .incrementQuantity(cart),
                                        onTapMinus: () =>
                                            BlocProvider.of<CartCubit>(context)
                                                .decrementQuantity(cart),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          BlocBuilder<CartCubit, CartState>(
                            builder: (context, state) {
                              return TotalPriceSection(
                                shipping: 70,
                                total:
                                    BlocProvider.of<CartCubit>(context).total,
                              );
                            },
                          ),
                          CustomElevatedButton(
                            icon: SvgPicture.asset(
                              Assets.images.cart,
                              color: Colors.white,
                            ),
                            label: 'Checkout',
                            backgroundColor: AppColors.accent,
                            onTap: () {
                              context.push('/checkout', extra: state.cartList);
                            },
                          ),
                          buildPaymentMethods()
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
            if (isQuantityLoading)
              Center(
                child: Container(
                  color: Colors.transparent,
                  height: 200,
                  width: 200,
                  child: const Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Row buildPaymentMethods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.secondary, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            Assets.images.mastercardSvgrepoCom,
            width: 40,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.secondary, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            Assets.images.visaSvgrepoCom,
            width: 40,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.secondary, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            Assets.images.paypal3SvgrepoCom,
            width: 40,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.secondary, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            Assets.images.cod,
            width: 40,
          ),
        ),
      ],
    );
  }
}

Widget buildDumyList() {
  return Skeletonizer(
    enabled: true,
    ignorePointers: true,
    child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FavouriteProductItem(
            product: ProductModel(
              id: 'dumy',
              productCategory: 'dumy',
              name: 'dumy',
              description: 'dumy',
              price: 1000,
              imageUrl:
                  'https://nclsdhzpcxkiizuunell.supabase.co/storage/v1/object/public/images//fff.png',
              status: 'dumy',
            ),
            onTapColumn: () {},
          ),
        );
      },
    ),
  );
}
