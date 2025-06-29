import 'dart:html' as html;
import 'package:flutter/material.dart';

class NoBackWrapper extends StatefulWidget {
  final Widget child;

  const NoBackWrapper({super.key, required this.child});

  @override
  State<NoBackWrapper> createState() => _NoBackWrapperState();
}

class _NoBackWrapperState extends State<NoBackWrapper> {
  @override
  void initState() {
    super.initState();
    // منع الرجوع بزر المتصفح
    html.window.history.pushState(null, '', html.window.location.href);
    html.window.onPopState.listen((event) {
      html.window.history.pushState(null, '', html.window.location.href);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // منع الرجوع بزر الرجوع في الهاتف
      child: widget.child,
    );
  }
}
