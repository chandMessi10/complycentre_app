import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/extensions/string_extenstions.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TemplateTile extends StatelessWidget {
  final String templateName;
  final String lastUpdated;
  final String? imageUrl;

  const TemplateTile({
    super.key,
    required this.templateName,
    required this.lastUpdated,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  ? Text(
                      templateName.getInitials(),
                      style: AppTextStyles.h3(
                        context,
                      ).copyWith(color: Colors.white),
                    )
                  : null,
            ),
            sizedBoxWidth(8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(templateName, style: AppTextStyles.h3(context)),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        'Last updated: ',
                        style: AppTextStyles.caption(
                          context,
                        ).copyWith(color: AppColors.secondaryText),
                      ),
                      Text(
                        lastUpdated,
                        style: AppTextStyles.statusText(
                          context,
                        ).copyWith(color: AppColors.secondaryText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                log('Edit tapped for $templateName');
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
