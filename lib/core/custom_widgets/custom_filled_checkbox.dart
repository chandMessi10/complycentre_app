import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double size;
  final Color? activeColor;
  final Color? checkColor;
  final Color? inactiveColor;

  const CustomFilledCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 12.0,
    this.activeColor,
    this.checkColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final active = activeColor ?? AppColors.primary;
    final inactive = inactiveColor ?? AppColors.primary;

    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(
          color: value ? active : Colors.transparent,
          border: Border.all(color: value ? active : inactive, width: 1.w),
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}
