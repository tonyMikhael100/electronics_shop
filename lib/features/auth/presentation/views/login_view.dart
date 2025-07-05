import 'package:electronics_shop/core/services/auth_service.dart';
import 'package:electronics_shop/features/auth/presentation/views/login_column.dart';
import 'package:electronics_shop/widgets/custom_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: CustomLayoutBuilder(
          mobileView: SingleChildScrollView(
            child: LoginColumn(),
          ),
          webView: SingleChildScrollView(
            child: Center(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/auth_image.png',
                      width: 700.w,
                      height: 800.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: LoginColumn(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
