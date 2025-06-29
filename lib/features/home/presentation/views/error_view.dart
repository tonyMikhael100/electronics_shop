import 'package:electronics_shop/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation/error_animation.json',
              animate: true,
              repeat: true,
            ),
            Text(
              'An error Occur',
              style: AppTextStyles.displayLarge(context),
            ),
          ],
        ),
      ),
    );
  }
}
