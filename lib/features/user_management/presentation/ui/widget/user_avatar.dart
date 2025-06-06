import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key, this.onTapFn, this.isTappable = false});
  final VoidCallback? onTapFn;
  final bool isTappable;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTapFn,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 60.r,
            width: 60.r,
            decoration: BoxDecoration(
              color: AppColors.tertiary,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderColor),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppAssets.user,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          if (isTappable)
            Positioned(
              bottom: 4,
              right: -4,
              child: Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.camera_alt_outlined, size: 12),
              ),
            ),
        ],
      ),
    );
  }
}
