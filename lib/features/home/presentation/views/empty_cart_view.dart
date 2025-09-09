import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset('assets/animation/empty_cart.json'),
          const SizedBox(height: 10),
          Text(AppLocalizations.of(context)!.emptyCartTitle,
              style: AppTextStyles.displayLarge(context)),
        ],
      ),
    );
  }
}
