import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/services/supabase_service.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/models/whishlist_model.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          _userLoaded
              ? BlocBuilder<WhishlistCubit, WhishlistState>(
                  builder: (context, state) {
                    final isInWishlist = whishlistCubit.isInWhishlist;
                    return IconButton(
                      icon: Icon(
                        isInWishlist ? Icons.favorite : Icons.favorite_border,
                        color: isInWishlist ? Colors.red : null,
                      ),
                      onPressed: () {
                        whishlistCubit.toggleWhishlist(
                          product: product,
                          tableName: 'wishlists',
                          userId: userId,
                          productId: product.id,
                        );
                      },
                    );
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300.h,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: AppTextStyles.displayMedium(context),
              ),
              const SizedBox(height: 8),
              Text(
                "${product.price} KWD",
                style: AppTextStyles.displayMedium(context).copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 16),
              Text(
                product.description,
                style: AppTextStyles.displaySmall(context).copyWith(
                    fontWeight: FontWeight.w100, color: Colors.black87),
              ),
              const SizedBox(height: 80), // For button space
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomElevatedButton(
          icon: Icons.shopping_cart_rounded,
          label: 'Add to Cart',
          backgroundColor: AppColors.primaryColor,
          onTap: () {
            // TODO: Handle add to cart
          },
        ),
      ),
    );
  }
}
