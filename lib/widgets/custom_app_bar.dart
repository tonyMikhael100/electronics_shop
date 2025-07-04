import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/widgets/custom_action_appbar_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showActionButton = true,
  });
  final String title;
  final bool? showActionButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title,
              style: AppTextStyles.displayMedium(context).copyWith(
                color: AppColors.primaryColor,
              )),
          SizedBox(
            width: 20,
          ),
          showActionButton == true ? CutsomActionAppBarIcons() : SizedBox(),
        ],
      ),
    );
  }
}
