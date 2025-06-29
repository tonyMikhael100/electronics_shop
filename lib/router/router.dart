import 'package:electronics_shop/features/auth/presentation/views/login_view.dart';
import 'package:electronics_shop/features/auth/presentation/views/signup_view.dart';
import 'package:electronics_shop/features/checkout/views/delivery_address_view.dart';
import 'package:electronics_shop/features/checkout/views/payment_view.dart';
import 'package:electronics_shop/features/checkout/views/tracking_order_view.dart';
import 'package:electronics_shop/features/home/presentation/views/cart_view.dart';
import 'package:electronics_shop/features/home/presentation/views/category_view.dart';
import 'package:electronics_shop/features/home/presentation/views/error_view.dart';
import 'package:electronics_shop/features/home/presentation/views/favourite_view.dart';
import 'package:electronics_shop/features/home/presentation/views/home_view.dart';
import 'package:electronics_shop/features/home/presentation/views/product_details_view.dart';
import 'package:electronics_shop/features/home/presentation/views/search_view.dart';
import 'package:electronics_shop/widgets/no_back.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: '/home_view',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/product_details',
        builder: (context, state) => const ProductDetailsView(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: '/favourite',
        builder: (context, state) => const FavouriteView(),
      ),
      GoRoute(
        path: '/category',
        builder: (context, state) => const CategoryView(),
      ),
      GoRoute(
        path: '/delivery_address',
        builder: (context, state) => DeliveryAddressView(),
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => PaymentView(),
      ),
      GoRoute(
        path: '/tracking_order',
        builder: (context, state) => NoBackWrapper(child: TrackingOrderView()),
      ),
    ],
    errorBuilder: (context, state) => Center(child: ErrorView()),
  );
}
