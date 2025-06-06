import 'package:cached_network_image/cached_network_image.dart';
import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/extensions/string_extenstions.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessTile extends StatelessWidget {
  const BusinessTile({
    required this.officeName,
    required this.address,
    required this.onTileTap,
    required this.teamCount,
    super.key,
    this.imageUrl,
  });

  final String officeName;
  final String address;
  final int teamCount;
  final String? imageUrl;
  final VoidCallback onTileTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.secondaryText,
                backgroundImage: imageUrl != null
                    ? CachedNetworkImageProvider(imageUrl!)
                    : null,
                child: imageUrl == null
                    ? Center(
                        child: Text(
                          officeName.getInitials(),
                          style: AppTextStyles.h3(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      )
                    : null,
              ),

              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(officeName, style: AppTextStyles.h3(context)),
                    SizedBox(height: 4.h),
                    Text(
                      '$address • $teamCount Team',
                      style: AppTextStyles.caption(
                        context,
                      ).copyWith(color: AppColors.tertiary),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.locationOutlined,
                          height: 12.h,
                          width: 12.w,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Locations',
                          style: AppTextStyles.caption(
                            context,
                          ).copyWith(color: AppColors.brandText),
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(
                          AppAssets.users,
                          height: 12.h,
                          width: 12.w,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Team',
                          style: AppTextStyles.caption(
                            context,
                          ).copyWith(color: AppColors.brandText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
