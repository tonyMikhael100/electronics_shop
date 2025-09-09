import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static double _minFont(double size) => size.sp < size ? size : size.sp;

  static TextStyle displayLarge(BuildContext context) {
    final color =
        Theme.of(context).textTheme.displayLarge?.color ?? Colors.black;
    return GoogleFonts.inter(
      fontSize: _minFont(32), // was 40
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle displaySmall(BuildContext context) {
    final color =
        Theme.of(context).textTheme.displaySmall?.color ?? Colors.black;
    return GoogleFonts.inter(
      fontSize: _minFont(12),
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle displayMedium(BuildContext context) {
    final color =
        Theme.of(context).textTheme.displayMedium?.color ?? AppColors.tertiary;
    return GoogleFonts.inter(
      fontSize: _minFont(22), // was 32
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle bodyLarge(BuildContext context) {
    final color =
        Theme.of(context).textTheme.bodyLarge?.color ?? AppColors.tertiary;
    return GoogleFonts.inter(
      fontSize: _minFont(16), // was 18
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    final color =
        Theme.of(context).textTheme.bodyMedium?.color ?? AppColors.tertiary;
    return GoogleFonts.inter(
      fontSize: _minFont(14), // was 16
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle titleMedium(BuildContext context) {
    final color =
        Theme.of(context).textTheme.titleMedium?.color ?? AppColors.tertiary;
    return GoogleFonts.inter(
      fontSize: _minFont(18), // was 20
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle labelLarge(BuildContext context) {
    final color =
        Theme.of(context).textTheme.labelLarge?.color ?? AppColors.tertiary;
    return GoogleFonts.inter(
      fontSize: _minFont(16), // was 18
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
}
