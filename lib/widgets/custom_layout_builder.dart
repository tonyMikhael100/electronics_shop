import 'package:flutter/material.dart';

class CustomLayoutBuilder extends StatelessWidget {
  const CustomLayoutBuilder({
    super.key,
    required this.mobileView,
    required this.webView,
  });
  final Widget mobileView;
  final Widget webView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile view
          return mobileView;
        } else {
          // Web view
          return webView;
        }
      },
    );
  }
}
