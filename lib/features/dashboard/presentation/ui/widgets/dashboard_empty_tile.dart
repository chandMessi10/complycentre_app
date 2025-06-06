import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardEmptyTile extends StatelessWidget {
  const DashboardEmptyTile({
    required this.message,
    required this.buttonText,
    required this.onButtonTap,
    super.key,
  });
  final String message;
  final String buttonText;
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(16.r),
        color: AppColors.borderColor,
      ),
      child: Container(
        padding: EdgeInsets.all(16.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: AppTextStyles.statusText(
                context,
              ).copyWith(color: AppColors.primaryText),
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: onButtonTap,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: AppColors.brandText,
                    size: 16.r,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    buttonText,
                    style: AppTextStyles.statusText(
                      context,
                    ).copyWith(color: AppColors.brandText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
