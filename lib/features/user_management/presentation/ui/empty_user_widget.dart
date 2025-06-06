import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EmptyUserWidget extends ConsumerWidget {
  const EmptyUserWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.emptyUser),
        sizedBoxHeight(24.h),
        Text('No users added yet', style: AppTextStyles.h3(context)),
        sizedBoxHeight(8.h),
        Text(
          'Get started by adding your first user to manage cleaning tasks.',
          style: AppTextStyles.bodyText(
            context,
          ).copyWith(color: AppColors.primaryText),
          textAlign: TextAlign.center,
        ),
        sizedBoxHeight(24.h),

        SizedBox(
          height: 36.h,
          child: CustomFilledButton(
            onBtnPressed: () {
              context.pushNamed(AppRoute.addBusiness.name);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, size: 16.r, color: Colors.white),
                sizedBoxWidth(8.w),
                Text(
                  'Invite user',
                  style: AppTextStyles.statusText(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
