import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late final String userId;
  bool _userLoaded = false;

  Future<void> _loadUserAndCheckWishlist() async {
    try {
      final email = FirebaseAuth.instance.currentUser!.email!;
      final userData = await SupabaseService().getUserData(email: email);
      userId = userData[0]['id'];
      await context.read<WhishlistCubit>().checkIfInWhishlist(
            tableName: 'wishlists',
            userId: userId,
            productId: widget.product.id,
          );
      setState(() {
        _userLoaded = true;
      });
    } on SocketException catch (e) {
    } on PostgrestException catch (e) {
      MyToast.showMyToast(
        context,
        icon: Icons.error,
        title: 'An error occur, check your internet connection',
        bgColor: AppColors.accent,
      );
    } catch (e) {
      MyToast.showMyToast(
        context,
        icon: Icons.error,
        title: 'An error occur, check your internet connection',
        bgColor: AppColors.accent,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserAndCheckWishlist();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final whishlistCubit = context.read<WhishlistCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: SafeArea(
          child: CustomAppBar(
            title: widget.product.productCategory,
            showBackButton: true,
            showDeleteButton: false,
            widget: Icon(Icons.delete),
            onTap: () {},
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    height: 360,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Hero(
                        tag: widget.product.id,
                        child: CachedNetworkImage(
                            imageUrl: widget.product.imageUrl)),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        whishlistCubit.toggleWhishlist(
                          tableName: 'wishlists',
                          userId: userId,
                          productId: widget.product.id,
                          product: product,
                        );
                        setState(() {});
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.r,
                        child: whishlistCubit.isInWhishlist
                            ? Icon(Icons.favorite, color: AppColors.accent)
                            : Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${widget.product.price.toString()} KWD',
                style: AppTextStyles.displayMedium(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.priceColor,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.product.name,
                style: AppTextStyles.displayMedium(context)
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.product.description,
                style: AppTextStyles.displaySmall(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: AppColors.tertiary),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomElevatedButton(
          icon: SvgPicture.asset(
            Assets.images.cart,
            color: Colors.white,
          ),
          label: AppLocalizations.of(context)!.addToCart,
          backgroundColor: AppColors.accent,
          onTap: () async {
            await BlocProvider.of<CartCubit>(context).addToCart(
              tableName: 'cart',
              cartModel: CartModel(
                id: '',
                userId: userId,
                product: product,
                quantity: 1,
              ),
            );
            MyToast.showMyToast(
              context,
              icon: Icons.check,
              title: '${widget.product.name} added to cart',
              bgColor: AppColors.accent,
            );
          },
        ),
      ),
    );
  }
}
