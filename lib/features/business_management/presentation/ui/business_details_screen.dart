import 'package:cached_network_image/cached_network_image.dart';
import 'package:complycentre_app/constants/app_assets.dart';
import 'package:complycentre_app/constants/data.dart';
import 'package:complycentre_app/core/custom_widgets/custom_filled_button.dart';
import 'package:complycentre_app/core/custom_widgets/custom_outlined_button.dart';
import 'package:complycentre_app/core/custom_widgets/dashboard_card.dart';
import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_colors.dart';
import 'package:complycentre_app/core/theme/app_text_styles.dart';
import 'package:complycentre_app/core/utils/custom_sized_box.dart';
import 'package:complycentre_app/features/business_management/presentation/ui/widgets/business_information_tile.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/widget/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BusinessDetailsScreen extends ConsumerWidget {
  const BusinessDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Business details',
          style: AppTextStyles.h3(context).copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CustomCard(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24.h,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          height: 108.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16.h,
                        children: [
                          Text(
                            'Business information',
                            style: AppTextStyles.h3(context),
                          ),

                          BusinessInformationTile(
                            label: 'Business name',
                            value: 'Clean office',
                          ),
                          BusinessInformationTile(
                            label: 'Address',
                            value: '45 Market Lane, New York, NY 10001, USA',
                            valueTextStyle: AppTextStyles.caption(
                              context,
                            ).copyWith(color: AppColors.brandText),
                          ),
                          BusinessInformationTile(
                            label: 'Phone number',
                            value: '+1 (415) 555-0132',
                          ),
                          BusinessInformationTile(
                            label: 'Email',
                            value: 'clean@gmail.com',
                          ),
                        ],
                      ),
                      Text('Assigned user', style: AppTextStyles.h3(context)),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dummyAssignedUsers.length,
                        separatorBuilder: (context, index) =>
                            sizedBoxHeight(16.h),
                        itemBuilder: (context, index) {
                          final user = dummyAssignedUsers[index];
                          return UserTile(
                            name: user.name,
                            email: user.email,
                            role: user.role,
                            avatarUrl: user.avatarUrl,
                            isActive: user.isActive,
                            onTileTap: () {
                              context.pushNamed(AppRoute.userDetail.name);
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomFilledButton(
                          onBtnPressed: () {
                            context.pushNamed(AppRoute.businessEdit.name);
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
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              actionsPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 16.h,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Delete confirmation',
                                    style: AppTextStyles.statusText(context),
                                  ),
                                  Text(
                                    'are you sure you want to delete this...',
                                    style: AppTextStyles.caption(context),
                                  ),
                                ],
                              ),
                              actions: [
                                CustomOutlinedButton(
                                  label: 'Cancel',
                                  onBtnPressed: () {
                                    context.pop();
                                  },
                                ),
                                sizedBoxWidth(8.w),
                                CustomFilledButton(
                                  backgroundColor: AppColors.danger,
                                  label: 'Delete',
                                  onBtnPressed: () {
                                    context.pop();
                                  },
                                ),
                              ],
                            ),
                          );
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
