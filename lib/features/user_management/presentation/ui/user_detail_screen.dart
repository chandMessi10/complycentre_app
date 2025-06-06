import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/constants/data.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/widgets/business_tile.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/widget/user_avatar.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/widget/user_role_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User details',
          style: AppTextStyles.h3(context).copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: CustomCard(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UserAvatar(),
                      sizedBoxHeight(8.h),
                      Text('Sonam khatri', style: AppTextStyles.h3(context)),
                      Text(
                        'sonam@gmail.com',
                        style: AppTextStyles.caption(
                          context,
                        ).copyWith(color: AppColors.secondaryText),
                      ),
                      sizedBoxHeight(8.h),
                      UserRoleChip(role: 'Cleaner'),
                      sizedBoxHeight(24.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Assigned business',
                          style: AppTextStyles.h3(context),
                        ),
                      ),
                      sizedBoxHeight(24.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dummyAssignedBusinesses.length,
                        separatorBuilder: (context, index) =>
                            sizedBoxHeight(24.h),
                        itemBuilder: (context, index) {
                          final business = dummyAssignedBusinesses[index];
                          return BusinessTile(
                            officeName: business.officeName,
                            address: business.address,
                            teamCount: business.teamCount,
                            imageUrl: business.imageUrl,
                            onTileTap: () {
                              context.pushNamed(AppRoute.businessDetail.name);
                            },
                          );
                        },
                      ),
                      sizedBoxHeight(24.h),
                      SizedBox(
                        width: double.infinity,
                        child: CustomFilledButton(
                          onBtnPressed: () {
                            context.pushNamed(AppRoute.userEdit.name);
                          },
                          label: 'Edit',
                          iconWidget: SvgPicture.asset(
                            AppAssets.edit,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      sizedBoxHeight(16.h),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Center(
                          child: Text(
                            'Delete',
                            style: AppTextStyles.h3(
                              context,
                            ).copyWith(color: AppColors.danger),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
