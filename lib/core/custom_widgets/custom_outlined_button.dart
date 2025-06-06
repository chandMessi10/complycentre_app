import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.label,
    this.labelStyle,
    required this.onBtnPressed,
    this.width,
    this.height,
    this.borderColor,
    this.labelColor,
    this.iconWidget,
  });
  final String label;
  final TextStyle? labelStyle;
  final VoidCallback onBtnPressed;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? labelColor;
  final Widget? iconWidget;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor ?? AppColors.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        fixedSize: Size(width ?? double.infinity, height ?? 40.h),
      ),
      icon: iconWidget,
      onPressed: onBtnPressed,
      label: Text(
        label,
        style:
            labelStyle ?? AppTextStyles.h3(context).copyWith(color: labelColor),
      ),
    );
  }
}
