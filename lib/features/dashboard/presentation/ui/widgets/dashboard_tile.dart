import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DashboardTile extends StatelessWidget {
  const DashboardTile({
    required this.value,
    required this.label,
    required this.assetName,
    required this.backgroundColor,

    required this.iconBGColor,
    required this.textColor,
    super.key,
  });

  final String value;
  final String label;
  final String assetName;
  final Color backgroundColor;
  final Color iconBGColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppTextStyles.h2(context).copyWith(color: textColor),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: AppTextStyles.bodyText(
                  context,
                ).copyWith(color: textColor),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: iconBGColor,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(4),
            child: SvgPicture.asset(
              assetName,
              width: 24.r,
              height: 24.r,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  
  }
}
