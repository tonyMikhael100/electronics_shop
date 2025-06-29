import 'package:electronics_shop/features/auth/data/repo/auth_repo_imp.dart';
import 'package:electronics_shop/features/checkout/view%20model/cubit/check_out_cubit.dart';
import 'package:electronics_shop/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

void main() {
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
