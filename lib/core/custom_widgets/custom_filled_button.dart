import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    required this.label,
    required this.onBtnPressed,
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.labelStyle,
    this.iconWidget,
    this.labelColor,
  });

  final String label;
  final TextStyle? labelStyle;
  final VoidCallback onBtnPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? labelColor;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
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
      icon: iconWidget,
      label: Text(
        label,
        style:
            labelStyle ??
            AppTextStyles.h3(
              context,
            ).copyWith(color: labelColor ?? Colors.white),
      ),
    );
  }
}
