import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/custom_outlined_button.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/widgets/dashboard_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Text('Dashboard', style: AppTextStyles.h2(context)),

          DashboardTile(
            value: '111',
            label: 'Total Business',
            assetName: AppAssets.briefcase,
            backgroundColor: AppColors.primaryLight,
            iconBGColor: AppColors.primary,
            textColor: AppColors.brandText,
          ),
          DashboardTile(
            value: '111',
            label: 'Total User',
            assetName: AppAssets.user,
            backgroundColor: AppColors.secondaryLight,
            iconBGColor: AppColors.secondary,
            textColor: AppColors.secondary,
          ),
          DashboardTile(
            value: '111',
            label: 'Total Templates',
            assetName: AppAssets.file,
            backgroundColor: AppColors.background,
            iconBGColor: AppColors.primaryText,
            textColor: AppColors.primaryText,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              Text('Quick actions', style: AppTextStyles.h3(context)),
              SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onBtnPressed: () {
                    context.pushNamed(AppRoute.addBusiness.name);
                  },
                  iconWidget: Icon(Icons.add_rounded),
                  label: 'Create new business',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomOutlinedButton(
                  label: 'Invite user',
                  labelColor: AppColors.primary,
                  onBtnPressed: () {
                    context.pushNamed(AppRoute.inviteUser.name);
                  },
                  iconWidget: SvgPicture.asset(
                    AppAssets.addUserIcon,
                    height: 24.h,
                    width: 24.w,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomOutlinedButton(
                  label: 'Create template',
                  labelColor: AppColors.primary,
                  onBtnPressed: () {},
                  iconWidget: SvgPicture.asset(
                    AppAssets.file,
                    height: 24.h,
                    width: 24.w,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
