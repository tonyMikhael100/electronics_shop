import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/core/router/router.dart';
import 'package:electronics_shop/features/checkout/presentation/view%20model/cubit/check_out_cubit.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/home_cubit.dart';
import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
import 'package:electronics_shop/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://nclsdhzpcxkiizuunell.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5jbHNkaHpwY3hraWl6dXVuZWxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEzNjkwMDQsImV4cCI6MjA2Njk0NTAwNH0.mJ8dYnUaoxrpxFyp99u1deOs1wIpbAfp1LdPiry7d5o',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = AppRouting.router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1280, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleWH: () => true,
      enableScaleText: () => true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CheckOutCubit(),
            ),
            BlocProvider(
              create: (context) => AuthCubit(),
            ),
            BlocProvider(
              create: (context) => WhishlistCubit(),
            ),
            BlocProvider(create: (context) {
              return HomeCubit()
                ..fetchBanners(tableName: 'banner')
                ..fetchCategories(tableName: 'categories')
                ..fetchProducts(tableName: 'products');
            }),
          ],
          child: ToastificationWrapper(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            ),
          ),
        );
      },
    );
  }
}
