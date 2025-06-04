import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) => ThemeData(
    fontFamily: "OpenSans",
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primary,
      seedColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      titleTextStyle: AppTextStyles.h3(context).copyWith(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        height: 1.5.h,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
        height: 1.5.h,
        letterSpacing: 0,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        height: 1.5.h,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        height: 1.5.h,
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
        height: 1.5.h,
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
        height: 1.5.h,
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        fontSize: 12.sp,
        height: 1.5.h,
        letterSpacing: 0,
      ),
    ),
  );
}
