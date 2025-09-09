import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    required this.onTap,
    required this.widget,
    this.showDeleteButton = false,
  });

  final String title;
  final bool showBackButton;
  final bool showDeleteButton;
  final void Function()? onTap;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          showBackButton
              ? InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(
                    isRTL
                        ? Icons.keyboard_arrow_right_rounded
                        : Icons.keyboard_arrow_left_rounded,
                    size: 50.sp,
                  ),
                )
              : SizedBox(width: 50.sp), // Ensure same width even if not shown
          Expanded(
            child: Center(
              child: Text(
                title,
                style: AppTextStyles.displayMedium(context).copyWith(
                  color: AppColors.accent,
                ),
              ),
            ),
          ),

          // dummy icon to balance layout visually
          showDeleteButton
              ? Row(
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(8)),
                        child: widget,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                )
              : Opacity(
                  opacity: 0,
                  child: Icon(
                    isRTL
                        ? Icons.keyboard_arrow_right_rounded
                        : Icons.keyboard_arrow_left_rounded,
                    size: 50.sp,
                  ),
                ),
        ],
      ),
    );
  }
}
