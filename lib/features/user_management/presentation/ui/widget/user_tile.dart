import 'package:cached_network_image/cached_network_image.dart';
import 'package:complycentre_app/core/extensions/string_extenstions.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/widget/user_role_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
    required this.onTileTap,
    super.key,
    this.avatarUrl,
  });

  final String name;
  final String email;
  final String role;
  final bool isActive;
  final String? avatarUrl;
  final VoidCallback onTileTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: Card(
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
                        name.getInitials(),
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
                  ],
                ),
              ),
              UserRoleChip(role: role),
            ],
          ),
        ),
      ),
    );
  }
}
