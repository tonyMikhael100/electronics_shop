import 'package:electronics_shop/core/app_styles.dart';
import 'package:flutter/material.dart';

class FilterListTile extends StatelessWidget {
  const FilterListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(title, style: AppTextStyles.bodyLarge(context)),
      onTap: onTap,
    );
  }
}
