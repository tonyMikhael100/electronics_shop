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
       
          // Mobile view
          return mobileView;
      
      },
    );
  }
}
