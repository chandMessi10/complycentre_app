import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    required this.child,
    required this.onBtnPressed,
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
  });

  final Widget child;
  final VoidCallback onBtnPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? AppColors.primary,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),

        fixedSize: WidgetStateProperty.all<Size?>(
          Size(width ?? double.infinity, height ?? 40.h),
        ),
      ),
      onPressed: onBtnPressed,
      child: child,
    );
  }
}
