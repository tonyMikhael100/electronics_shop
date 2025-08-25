import 'package:electronics_shop/features/auth/presentation/views/signup_column.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(54),
          child: CustomAppBar(
              title: 'Sign up',
              onTap: () {},
              widget: Icon(Icons.arrow_back_ios_new_rounded))),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: CustomLayoutBuilder(
          mobileView: SingleChildScrollView(
            child: SignupColumn(),
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
                    child: SignupColumn(),
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
