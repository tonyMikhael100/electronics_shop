import 'package:electronics_shop/core/localization/cubit/localization_cubit.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSelectionDialog extends StatelessWidget {
  const LanguageSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        final localizationCubit = context.read<LocalizationCubit>();
        final l10n = AppLocalizations.of(context)!;

        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            l10n.selectLanguage,
            style: AppTextStyles.displayMedium(context).copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LanguageOption(
                title: l10n.english,
                isSelected: localizationCubit.isEnglish,
                onTap: () {
                  localizationCubit.changeLanguage('en');
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 12),
              _LanguageOption(
                title: l10n.arabic,
                isSelected: localizationCubit.isArabic,
                onTap: () {
                  localizationCubit.changeLanguage('ar');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.cancel,
                style: TextStyle(color: AppColors.accent),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.accent : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.accent.withOpacity(0.1) : null,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColors.accent : Colors.grey,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: AppTextStyles.bodyMedium(context).copyWith(
                color: isSelected ? AppColors.accent : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
