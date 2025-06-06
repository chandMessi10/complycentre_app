import 'dart:developer';

import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/widgets/dashboard_empty_tile.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/widgets/dashboard_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Text('Dashboard', style: AppTextStyles.h2(context)),
          DashboardEmptyTile(
            message: 'No business added yet',
            buttonText: 'Add business',
            onButtonTap: () {
              log('business added');
            },
          ),
          DashboardEmptyTile(
            message: 'No users found',
            buttonText: 'Add user',
            onButtonTap: () {},
          ),
          DashboardEmptyTile(
            message: 'No templates created',
            buttonText: 'Create template',
            onButtonTap: () {},
          ),
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
        ],
      ),
    );
  }
}
