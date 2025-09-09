import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.traillingIcon,
    this.onTap,
  });

  final String title;
  final IconData leadingIcon;
  final IconData traillingIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 8),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: 35,
        ),
        title: Text(
          title,
          style: AppTextStyles.bodyMedium(context),
        ),
        trailing: Icon(traillingIcon),
        onTap: onTap,
      ),
    );
  }
}
