import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
    this.avatarUrl,
  });

  final String name;
  final String email;
  final String role;
  final bool isActive;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
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
              backgroundColor: AppColors.primary,
              backgroundImage: avatarUrl != null
                  ? CachedNetworkImageProvider(avatarUrl!)
                  : null,
              child: avatarUrl == null
                  ? Text(
                      name.isNotEmpty ? name[0].toUpperCase() : '',
                      style: AppTextStyles.h3(
                        context,
                      ).copyWith(color: Colors.white),
                    )
                  : null,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(name, style: AppTextStyles.h3(context)),
                      SizedBox(width: 8.w),
                      Container(
                        width: 8.r,
                        height: 8.r,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.success
                              : AppColors.tertiary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    email,
                    style: AppTextStyles.caption(
                      context,
                    ).copyWith(color: AppColors.secondaryText),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      role,
                      style: AppTextStyles.statusText(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                log('Edit tapped for $name');
              },
              child: SvgPicture.asset(
                AppAssets.edit,
                height: 20.h,
                width: 20.w,
                colorFilter: ColorFilter.mode(
                  AppColors.secondaryText,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
