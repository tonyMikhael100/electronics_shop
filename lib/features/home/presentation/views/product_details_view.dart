import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/models/whishlist_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: CustomAppBar(title: widget.product.productCategory),
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
                '${widget.product.price.toString()} LE',
                style: AppTextStyles.displayMedium(context)
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
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
          icon: Icons.shopping_cart_rounded,
          label: 'Add to Cart',
          backgroundColor: AppColors.accent,
          onTap: () {
            // TODO: Handle add to cart
          },
        ),
      ),
    );
  }
}
