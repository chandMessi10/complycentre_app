import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EmptyBusinessWidget extends ConsumerWidget {
  const EmptyBusinessWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.emptyBusiness),
        sizedBoxHeight(24.h),
        Text('No Business Created yet', style: AppTextStyles.h3(context)),
        sizedBoxHeight(8.h),
        Text(
          'Get started by creawting your first business.',
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
                  'Create business',
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
