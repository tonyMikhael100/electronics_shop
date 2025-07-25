import 'package:electronics_shop/features/auth/presentation/views/login_view.dart';
import 'package:electronics_shop/features/auth/presentation/views/signup_view.dart';
import 'package:electronics_shop/features/checkout/data/models/cart_model.dart';
import 'package:electronics_shop/features/checkout/presentation/views/check_out_view.dart';
import 'package:electronics_shop/features/checkout/presentation/views/payment_view.dart';
import 'package:electronics_shop/features/home/data/models/product_item_model.dart';
import 'package:electronics_shop/features/home/data/models/whishlist_model.dart';
import 'package:electronics_shop/features/home/presentation/views/cart_view.dart';
import 'package:electronics_shop/features/home/presentation/views/category_view.dart';
import 'package:electronics_shop/features/home/presentation/views/error_view.dart';
import 'package:electronics_shop/features/home/presentation/views/favourite_view.dart';
import 'package:electronics_shop/features/home/presentation/views/home_view.dart';
import 'package:electronics_shop/features/home/presentation/views/product_details_view.dart';
import 'package:electronics_shop/features/search/presentation/views/search_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final loggedIn = user != null;

      // صفحات عامة مسموح بها بدون تسجيل دخول
      final publicPaths = ['/', '/signup'];
      final isGoingToPublic = publicPaths.contains(state.matchedLocation);
      if (!loggedIn && !isGoingToPublic) {
        // لو مش مسجل دخول وداخل على صفحة خاصة، ارجعه لـ login
        return '/';
      }

      if (loggedIn && isGoingToPublic) {
        // لو مسجل دخول وبيحاول يدخل على login أو register، نرجعه على home
        return '/home_view';
      }
      return null; // لا يوجد تحويل
    },
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
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailsView(product: product);
        },
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
        builder: (context, state) => FavouriteView(),
      ),
      GoRoute(
        path: '/category',
        builder: (context, state) => const CategoryView(),
      ),
      GoRoute(
        path: '/checkout',
        builder: (context, state) {
          final cartProducts = state.extra as List<CartModel>;
          return CheckOutView(cartProducts: cartProducts);
        },
      ),
      // GoRoute(
      //   path: '/payment',
      //   builder: (context, state) => PaymentView(),
      // ),
      // GoRoute(
      //   path: '/settings_view',
      //   builder: (context, state) => SettingsView(),
      // ),
      // GoRoute(
      //   path: '/profile_view',
      //   builder: (context, state) => ProfileView(),
      // ),
      // GoRoute(
      //   path: '/orders_view',
      //   builder: (context, state) => ProfileView(),
      // ),
    ],
    errorBuilder: (context, state) => Center(child: ErrorView()),
  );
}
