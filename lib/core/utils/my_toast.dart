import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class MyToast {
  static void showMyToast(
    BuildContext context, {
    required IconData icon,
    required String title,
    Color? bgColor,
  }) {
    toastification.show(
      // optional if you use ToastificationWrapper
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(
        title,
        style: AppTextStyles.bodyMedium(context).copyWith(color: Colors.white),
      ),
      // you can also use RichText widget for title and description parameters
      // description: RichText(
      //   text: TextSpan(text: ''),
      // ),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      showIcon: true, // show or hide the icon
      primaryColor: Colors.green,
      backgroundColor: bgColor ?? Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.none,
        buttonBuilder: (context, onClose) {
          return OutlinedButton.icon(
            onPressed: onClose,
            icon: Icon(
              Icons.close,
              size: 20,
              color: Colors.white,
            ),
            label: Text(
              'Close',
              style: AppTextStyles.bodyMedium(context),
            ),
          );
        },
      ),
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) {

        },
        onAutoCompleteCompleted: (toastItem) =>
            print('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) {},
      ),
    );
  }
}
