import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessTile extends StatelessWidget {
  final String officeName;
  final int locationCount;
  final int teamCount;
  final String? imageUrl; // Optional: for office image

  const BusinessTile({
    super.key,
    required this.officeName,
    required this.locationCount,
    required this.teamCount,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero, // Adjust margin as needed in the list
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.borderColor,
        ), // Use AppColors.borderColor
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 16.h,
        ), // Adjust padding as needed
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Office Image or Initials
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.secondaryText,
              backgroundImage: imageUrl != null
                  ? CachedNetworkImageProvider(imageUrl!)
                  : null,
              child: imageUrl == null
                  ? Center(
                      child: Text(
                        officeName.isNotEmpty
                            ? officeName[0].toUpperCase()
                            : '',
                        style: AppTextStyles.h3(
                          context,
                        ).copyWith(color: Colors.white), // Initials style
                      ),
                    )
                  : null,
            ),

            SizedBox(width: 8.w), // Space between image and text
            // Business Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    officeName,
                    style: AppTextStyles.h3(
                      context,
                    ), // Office name style (using bodyText and making it bold)
                  ),
                  SizedBox(height: 4.h), // Space between name and details
                  Text(
                    '$locationCount Location • $teamCount Team', // Location and Team count
                    style: AppTextStyles.caption(
                      context,
                    ).copyWith(color: AppColors.tertiary), // Details style
                  ),
                  SizedBox(height: 8.h), // Space between details and links
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
                        style: AppTextStyles.caption(context).copyWith(
                          color: AppColors.brandText,
                        ), // Locations link style
                      ),
                      SizedBox(width: 8.w), // Space between links
                      SvgPicture.asset(
                        AppAssets.users,
                        height: 12.h,
                        width: 12.w,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ), // Team icon
                      SizedBox(width: 4.w),
                      Text(
                        'Team',
                        style: AppTextStyles.caption(context).copyWith(
                          color: AppColors.brandText,
                        ), // Team link style
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                log('More options tapped for $officeName');
              },
              child: Icon(
                Icons.more_vert,
                size: 20.r,
                color: AppColors.primaryText,
              ), // More options icon
            ),
          ],
        ),
      ),
    );
  }
}
